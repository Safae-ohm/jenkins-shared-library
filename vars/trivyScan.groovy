def dockerSplitReports(String imageName, String imageTag) {
    script {
        setupTrivyFiles()

        // Output paths
        def mediumJson = "${WORKSPACE}/trivy-image-MEDIUM-results.json"
        def criticalJson = "${WORKSPACE}/trivy-image-CRITICAL-results.json"
        def mediumHtml = "${WORKSPACE}/trivy-image-MEDIUM-results.html"
        def criticalHtml = "${WORKSPACE}/trivy-image-CRITICAL-results.html"

        // Run scans separately
        def scanMedium = """
            trivy image ${imageName}:${imageTag} \
                --severity LOW,MEDIUM \
                --exit-code 0 \
                --quiet \
                --format json -o ${mediumJson}
        """.stripIndent()

        def scanCritical = """
            trivy image ${imageName}:${imageTag} \
                --severity CRITICAL \
                --exit-code 1 \
                --quiet \
                --format json -o ${criticalJson}
        """.stripIndent()

        def exitCodeMedium = sh(script: scanMedium, returnStatus: true)
        def exitCodeCritical = sh(script: scanCritical, returnStatus: true)

        // Convert both JSON reports to HTML
        def convertMedium = """
            trivy convert --format template \
                --template '@${WORKSPACE}/html.tpl' \
                --output ${mediumHtml} ${mediumJson}
        """.stripIndent()

        def convertCritical = """
            trivy convert --format template \
                --template '@${WORKSPACE}/html.tpl' \
                --output ${criticalHtml} ${criticalJson}
        """.stripIndent()

        sh convertMedium
        sh convertCritical

        // Return both exit codes for reference
        return [
            mediumExitCode: exitCodeMedium,
            criticalExitCode: exitCodeCritical
        ]
    }
}
