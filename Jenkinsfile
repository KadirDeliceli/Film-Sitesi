pipeline {
    agent any

    environment {
        IMAGE_NAME = "kadir57/film-site"
        IMAGE_TAG = "v${BUILD_NUMBER}"
    }

    stages {

        stage('Git Pull') {
            steps {
                git 'https://github.com/KadirDeliceli/Film-Sitesi.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:$IMAGE_TAG .
                docker tag $IMAGE_NAME:$IMAGE_TAG $IMAGE_NAME:latest
                '''
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin

                    docker push $IMAGE_NAME:$IMAGE_TAG
                    docker push $IMAGE_NAME:latest
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {

                sh '''
                kubectl apply -f film-k8s/mysql-pv.yaml
                kubectl apply -f film-k8s/mysql-pvc.yaml -n default
                kubectl apply -f film-k8s/mysql-service.yaml -n default
                kubectl apply -f film-k8s/mysql-deployment.yaml -n default
                kubectl apply -f film-k8s/mysql-networkpolicy.yaml -n default
                kubectl apply -f film-k8s/web-service.yaml -n default
                '''

                sh '''
                kubectl set image deployment/film-web \
                film-web=$IMAGE_NAME:$IMAGE_TAG \
                -n default
                '''
            }
        }
    }
}