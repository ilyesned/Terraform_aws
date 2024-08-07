pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/ilyesned/Terraform_aws.git', branch: 'main', credentialsId: 'github-credentials'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform init'
                sh 'terraform plan -out=tfplan'
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
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?", parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }
        stage('Apply') {
            steps {
                sh 'terraform apply -input=false tfplan'
            }
        }
    }
}

