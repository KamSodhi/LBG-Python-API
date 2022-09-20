pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t kamsodhi/automated-image:latest  -t kamsodhi/automated-image:$BUILD_NUMBER .
                docker push kamsodhi/automated-image:latest
                docker push kamsodhi/automated-image:$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                ssh -i ~/.ssh/id_rsa' jenkins@35.230.143.160 << EOF
                
                docker stop auto-container
                docker rm auto-container

                docker run -d -p 8080:8080 --name auto-container kamsodhi/automated-image:latest
                '''
            }
        }
    }
}