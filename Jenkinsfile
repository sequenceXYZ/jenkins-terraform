pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }

   agent  any
    stages {
        stage('checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sequenceXYZ/jenkins-terraform.git'
            }
        }

        stage('Plan') {
            steps {
                sh 'pwd' 
                sh 'terraform init'
                sh 'terraform plan -out tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'jenkins-terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh 'pwd'
                sh 'terraform apply -input=false tfplan'
            }
        }
    }

  }
