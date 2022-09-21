pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t gcr.io/lbg7-20220905/kam-automated-image:latest  -t gcr.io/lbg7-20220905/kam-automated-image:$BUILD_NUMBER .
                docker push gcr.io/lbg7-20220905/kam-automated-image:latest
                docker push gcr.io/lbg7-20220905/kam-automated-image:$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                ssh -i '~/.ssh/id_rsa' jenkins@35.246.6.64 << EOF
                
                docker stop auto-container
                docker rm auto-container

                docker run -d -p 8080:5000 --name auto-container gcr.io/lbg7-20220905/kam-automated-image:latest
                '''
            }
        }
    }
}