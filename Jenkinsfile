pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/nawaf83/review.git'
            }
        }
        stage('Build') {
            steps { bat 'gradlew build'}
        }
        stage('Test') {
            steps { bat 'gradlew test'} 
        }
        stage('Deploy') {
            steps { 
                powershell 'docker build -t Deployment_env .'
                powershell 'docker run Deployment_env'
            } 
            stage('Production') {
            steps { 
                powershell 'docker run Deployment_env'
            }          
        }    
}

post {
        always {
            echo 'Cleaning up workspace'
            deleteDir() // Clean up the workspace after the build
        }
        success {
            echo 'Build succeeded!!!'
            // You could add notification steps here
        }
        failure {
            echo 'Build failed!'
            // You could add notification steps here
        }
    }
}
