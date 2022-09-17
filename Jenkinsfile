pipeline {
    agent any

   // parameters {
   //     string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
    //    booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
     //   booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')

  //  }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWSAccessKeyId')
        AWS_SECRET_ACCESS_KEY = credentials('AWSSecretKey')
    }


    stages {
        stage('checkout') {
            steps {
                
             
                sh 'git clone https://github.com/nourahkareemalanazi/Terraform.git'
            }
            }

        stage('Plan') {
            
            
            steps {
                sh 'terraform init '
                sh 'terraform plan '
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
       
         

        stage('Apply') {
            
            
            steps {
                sh "terraform apply "
            }
        }
        

  }
}
