pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/nawaf83/Review.git'
            }
        }
        stage('Build and Test') {
            parallel {
            stage('Build') {
                steps { bat 'gradlew build' }
            }
            stage('Test') {
                steps { bat 'gradlew test' }
            }
            }
        }
        stage('Deploy') {
            steps { 
                powershell '''
                    if (docker images -q deployment_env) {
                        Write-Host "deployment_env image exists. Removing..."
                        docker rmi -f deployment_env
                    } else {
                        Write-Host "deployment_env image does not exist."
                    }
                    docker build -t deployment_env .
                '''

            } 
        }
            stage('Production') {
            steps { 
                powershell 'docker run deployment_env'
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
