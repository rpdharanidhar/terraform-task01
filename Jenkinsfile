pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/rpdharanidhar/devops-task02.git', branch: 'main', credentialsId: 'git-credentials'
            }
        }
        stage('Initialization') {
            steps {
                bat "D:\\OCI\\DevOps\\terraform\\terraform.exe init"
            }
        }
        stage('To align in format') {
            steps {
                bat "D:\\OCI\\DevOps\\terraform\\terraform.exe fmt -recursive"
            }
        }
        stage('Validate the terraform code') {
            steps {
                bat "D:\\OCI\\DevOps\\terraform\\terraform.exe validate"
            }
        }
        // stage('To vizualize the resources') {
        //     steps {
        //         bat "D:\\OCI\\DevOps\\terraform\\terraform.exe plan"
        //     }
        // }
        // stage('Creation stage') {
            steps {
                bat "D:\\OCI\\DevOps\\terraform\\terraform.exe apply -auto-approve"
            }
        }
        stage('Cleaning up') {
            steps{
                bat "D:\\OCI\\DevOps\\terraform\\terraform.exe destroy"
            }
        }
    }
}   
