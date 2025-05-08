def call() {    

         def install = sh(script: 'npm install --no-audit') 
         def dependencycheck= sh(script: 'npm audit --audit-level=critical')
      }



