def call() {
           node{    
                sh 'npm ci --no-audit'  
                sh 'npm install --no-audit'
           }
}


