pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "docker build -t task4 ."
            }
        }
      
        stage('Deploy') {
            steps {
                sh "docker run -d -p 8081:8080 task4"
            }
        }
    }
}
