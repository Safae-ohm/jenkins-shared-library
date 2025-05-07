//  Installation des dépendances NPM

def call() {
    stage('Install dependencies') {
            sh 'npm ci --no-audit'
            sh 'npm install --no-audit'        
    }
}
