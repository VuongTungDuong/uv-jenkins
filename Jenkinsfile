pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh ('docker compose build')
            }
        }
        stage('Scan security') {
            steps {
                echo "Scan ..."
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}