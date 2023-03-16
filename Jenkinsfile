pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "docker build -t task4:latest --no-cache ."
            }
        }
        stage('Tag and Push') {
            steps {
                                
               withCredentials([file(credentialsId: 'gcp-service-account-file', variable: 'GCR_KEY')]) {
                  docker tag task4 gcr.io/lbg-cohort-10/task4:latest
                  docker push gcr.io/lbg-cohort-10/task4:latest
               }
                
            }
        }
        stage('Deploy') {
            steps {
                sh "docker run -d -p 8085:8080 task4"
            }
        }
    }
}
