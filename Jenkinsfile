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
                sh """
                gcloud auth configure-docker -y
                docker tag task4:latest gcr.io/lbg-cohort-10/task4:latest
                docker push gcr.io/lbg-cohort-10/task4:latest
                """
            }
        }
        stage('Deploy') {
            steps {
                sh "docker run -d -p 8085:8080 task4"
            }
        }
    }
}
