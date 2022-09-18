pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/nourahkareemalanazi/Terraform.git'
            }
        }
        
        stage('terraform Init') {
            steps{
                dir('cloudfront-build') 
                {
                sh 'terraform init'
                }
            }
        }
        stage ("terraform fmt") {
            steps {
                dir('cloudfront-build') {
                sh 'terraform fmt'
                }
            }
        }
        stage ("terraform validate") {
            steps {
                dir('cloudfront-build') {
                sh 'terraform validate'
                }
            }
        }

        stage('terraform Plan') {
            steps{
                dir('cloudfront-build') 
                {
                sh 'terraform plan'
                }
            }
        }

        stage('terraform apply') {
            steps{
                dir('cloudfront-build') 
                {
                sh 'terraform apply --auto-approve'
                }
            }
        }
    }

    
}
