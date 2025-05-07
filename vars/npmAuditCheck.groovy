// Audit des dépendances NPM

def call() {
    stage('NPM Dependency Audit') {
        when {
            expression { !params.DEPLOY_TO_PROD_ONLY }
        }
        steps {
            catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                sh 'npm audit --audit-level=critical'
            }
        }
    }
}v
