pipeline {
    environment {
        registry = 'wschaefer42/jenkins-docker-test'
        DOCKER_LOGIN = credentials('docker-login')
    }
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build a Push Docker Image') {
            steps {
                sh 'docker build -t $registry:$BUILD_NUMBER .'
                sh 'docker login -u wschaefer42 -p $DOCKER_LOGIN_PSW'
                sh 'docker push $registry:$BUILD_NUMBER'
                sh 'docker rm $registry:$BUILD_NUMBER'
            }
        }
    }
}