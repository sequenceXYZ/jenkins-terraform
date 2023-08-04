pipeline {

    agent  any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }

    stages {
        stage('SCM checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sequenceXYZ/jenkins-terraform-vpc.git'
        }
    }
        stage('TF init') {
            steps {
                sh 'pwd' 
                sh 'terraform init'
            }
        }
        stage('TF plan') {
           steps {
               sh 'terraform plan'
           }
        } 
        stage('TF apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
  }
