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
                withCredentials([file(credentialsId: 'gcp-service-account-file', variable: 'GC_KEY')]) {
                    sh """
                    gcloud auth activate-service-account thembaba-jenkins@lbg-cohort-10.iam.gserviceaccount.com --key-file=${GC_KEY}
                    gcloud auth configure-docker
                    docker tag task4:latest gcr.io/lbg-cohort-10/task4:latest
                    docker push gcr.io/lbg-cohort-10/task4:latest
                    """
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
