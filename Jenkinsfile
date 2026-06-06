pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'java -version'
                sh 'mvn -version'
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t java-demo .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop java-container || true
                docker rm java-container || true
                docker run -d --name java-container -p 8081:8080 java-demo
                '''
            }
        }
    }

    post {
        success {
            echo 'Build Successful'
        }

        failure {
            echo 'Build Failed'
        }
    }
}
