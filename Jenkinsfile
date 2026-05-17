pipeline {
    agent any

    environment {
        IMAGE_NAME = "kadir57/film-site"
    }

    stages {

        stage('Git Pull') {
            steps {
                git 'https://github.com/KadirDeliceli/Film-Sitesi.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Docker Push') {
            steps {

                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'

                    sh 'docker push $IMAGE_NAME:latest'
                }
            }
        }

        stage('Deploy') {
            steps {

                sh 'kubectl delete svc film-web-service --ignore-not-found=true'

                sh '''
                kubectl apply -f film-k8s/mysql-pv.yaml
                kubectl apply -f film-k8s/mysql-pvc.yaml
                kubectl apply -f film-k8s/mysql-service.yaml
                kubectl apply -f film-k8s/mysql-deployment.yaml

                kubectl apply -f film-k8s/mysql-networkpolicy.yaml

                kubectl apply -f film-k8s/web-deployment.yaml
                kubectl apply -f film-k8s/web-service.yaml
                '''

                sh 'kubectl rollout restart deployment film-web'
                sh 'kubectl rollout status deployment film-web'
            }
        }
    }
}