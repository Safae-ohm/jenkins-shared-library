//  Installation des dépendances NPM

def call() {
    stage('Install dependencies') {
        steps {
            sh 'npm ci --no-audit'
            sh 'npm install --no-audit'
        }
    }
}
