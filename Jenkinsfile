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
                   sh '''
                      echo $GCR_KEY > /tmp/gcr_key.json
                      docker login -u _json_key --password-stdin https://gcr.io < /tmp/gcr_key.json
                      docker tag YOUR_IMAGE_NAME gcr.io/PROJECT_ID/YOUR_IMAGE_NAME
                      docker push gcr.io/PROJECT_ID/YOUR_IMAGE_NAME
                   '''
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
