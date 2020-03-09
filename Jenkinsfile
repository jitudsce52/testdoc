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
                sh 'docker build -t jitu/mkdocs .'
            }
        }
        stage('produce') {
            steps {
                sh './mkdockerize.sh produce'
            }
        }
        stage('Serve') {
            steps {
                sh './mkdockerize.sh serve'
                echo 'Deploying....'
            }
        }
    }
}
