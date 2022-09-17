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
                sh'pwd'
                sh'cd terraform'
                sh "git clone https://github.com/nourahkareemalanazi/Terraform.git"
            }
            }

        stage('Plan') {
            
            
            steps {
                sh 'terraform init -input=false'
                sh 'terraform workspace select ${environment} || terraform workspace new ${environment}'

                sh "terraform plan -input=false -out tfplan "
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
       
           
                
          
           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            
            
            steps {
                sh "terraform apply -input=false tfplan"
            }
        }
        
        stage('Destroy') {
           
        steps {
           sh "terraform destroy --auto-approve"
        }
    }

  }
}
