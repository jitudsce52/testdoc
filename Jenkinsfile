pipeline {
    agent none
    stage ('Checkout') {
        agent any
        steps {
            checkout scm
        }

    }
    stage ('Build') {
        agent any
	steps {
	  sh 'docker build -t jitu/mkdocs .'	
      }
    }
    stage ('deploy') {
        agent any
	steps {
          sh 'mkdockerize.sh'
	}
    }
}
