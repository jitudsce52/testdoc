pipeline {
    agent any

    stages {
	stage('checkout') {
            steps {
	        checkout scm
	    }
	}
        stage('Build') {
            steps {
                sh 'docker build -f jitu/mkdocs .'
            }
        }
        stage('Test') {
            steps {
                sh 'mkdockerize.sh"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
