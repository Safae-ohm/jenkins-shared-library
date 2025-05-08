def call(Map args) {
    def imageName = args.imageName
    def imageTag = args.imageTag

    script {
        // Load the Trivy template 
        def tplContent = libraryResource "trivy/html.tpl"
        writeFile file: "${WORKSPACE}/html.tpl", text: tplContent

        def trivyConfigContent = libraryResource "trivy/trivy.yml"
        writeFile file: "${WORKSPACE}/trivy.yml", text: trivyConfigContent

        // Run Trivy scan on the pushed image
        def command = "trivy image --config ${WORKSPACE}/trivy.yml --template '@${WORKSPACE}/html.tpl' -o ${WORKSPACE}/trivy-report.html ${imageName}:${imageTag}"
        def exitCode = sh(script: command, returnStatus: true)

        // Mark the build as failed if vulnerabilities are found
        if (exitCode != 0) {
            error "Trivy scan failed — vulnerabilities found"
        } else {
            echo "Trivy scan passed — no critical vulnerabilities."
        }

        // Archive the report
        archiveArtifacts artifacts: 'trivy-report.html', allowEmptyArchive: true

        return exitCode
    }
}

