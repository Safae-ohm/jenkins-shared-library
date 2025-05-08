def install() {
                sh 'npm ci --no-audit'  
                sh 'npm install --no-audit'
}

def test() {
              sh 'npm audit --audit-level=critical'
}

def coverage() {
    sh 'npm run test:cov'
}
return this
