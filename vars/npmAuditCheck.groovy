// Audit des dépendances NPM

def call() {
    stage('NPM Dependency Audit') {
         sh 'npm audit --audit-level=critical'    
    }
}
