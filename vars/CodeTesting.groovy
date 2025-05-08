def call(Map config = [:]) {
    pipeline {
	
        agent any
		
        stages {
		
        stage('install dependencies') {
            steps {
                sh 'npm ci --no-audit'  
                sh 'npm install --no-audit'
            }
        }

        stage('dependency check') {
            parallel {
                stage('NPM Dependency Audit') {

                    steps {
                        catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                            sh 'npm audit --audit-level=critical'
                        }
                    }
                }

                stage('OWASP Dependency-Check') {
                    steps {
                        catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                            dependencyCheck additionalArguments: '''
                                --out "./"
                                --scan "./"
                                --format "ALL"
                                --prettyPrint''',
                                odcInstallation: 'OWASP-Dep-Check-12'

                            dependencyCheckPublisher(
                                pattern: 'dependency-check-report.xml',
                                failedTotalCritical: 1,
                                stopBuild: false
                            )

                        }
                    }
                }
            }
        }

        stage('unit testing') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    sh 'npm test'
                }
            }
        }

        stage('code coverage') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    sh 'npm run test:cov'
                }
            }
        }
        }
    }
}
