pipeline {
    agent any


    stages {
        stage('checkout') {
            steps {
                
                sh'pwd'
                sh 'git clone https://github.com/nourahkareemalanazi/Terraform.git'
            }
            }

        stage('Plan') {
            
            
            steps {
                sh 'terraform init '
                sh 'terraform plan '
               
            }
        }
       
         

        stage('Apply') {
            
            
            steps {
                sh "terraform apply "
            }
        }
        

  }
}
