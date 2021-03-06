pipeline {
    environment {
        registry = 'wschaefer42/jenkins-docker-test'
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
            environment {
                DOCKER_PWD = credentials('docker-login-pwd')
            }
            steps {
                sh 'docker build -t $registry:$BUILD_NUMBER .'
                sh 'docker login -u wschaefer42 -p $DOCKER_PWD'
                sh 'docker images'
                sh 'docker push $registry:$BUILD_NUMBER'
                sh 'docker rmi $registry:$BUILD_NUMBER'
            }
        }
        stage('Deploy and smoke test') {
            steps{
                sh './jenkins/scripts/deploy-and-test.sh'
            }
        }
        stage('Clean-up') {
            steps {
                sh './jenkins/scripts/cleanup.sh'
            }
        }
    }
}