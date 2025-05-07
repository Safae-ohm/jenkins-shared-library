def call() {
    def tag = sh(script: 'git describe --tags --abbrev=0 || echo "no-tag"', returnStdout: true).trim()
    env.GIT_LAST_TAG = tag
    echo "Dernier tag Git trouvé : ${env.GIT_LAST_TAG}"
    return tag
}
