def trivyScan(String imageName, String imageTag) {
    script {
        // Write Trivy config and HTML template from shared library
        def tplContent = libraryResource "trivy/html.tpl"
        writeFile file: "${WORKSPACE}/html.tpl", text: tplContent

        def trivyConfigContent = libraryResource "trivy/trivy.yml"
        writeFile file: "${WORKSPACE}/trivy.yml", text: trivyConfigContent

        // Build Trivy command
        def command = "trivy image --config ${WORKSPACE}/trivy.yml --template '@${WORKSPACE}/html.tpl' -o ${WORKSPACE}/trivy-report.html ${imageName}:${imageTag}"

        // Run Trivy and capture exit code
        def exitCode = sh(script: command, returnStatus: true)

        // Fail the build if there are vulnerabilities
        if (exitCode != 0) {
            error "Trivy scan failed — vulnerabilities found"
        } else {
            echo "Trivy scan passed — no critical vulnerabilities."
        }

        return exitCode
    }
}

