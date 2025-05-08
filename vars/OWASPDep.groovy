def runDependencyCheck(Map params = [:]) {
    catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
        dependencyCheck additionalArguments: """
            --out "./"
            --scan "./"
            --format "ALL"
            --prettyPrint""",
            odcInstallation: params.odcInstallation ?: 'OWASP-Dep-Check-12'

        dependencyCheckPublisher(
            pattern: 'dependency-check-report.xml',
            failedTotalCritical: params.failedTotalCritical ?: 1,
            stopBuild: false
        )
    }
}
