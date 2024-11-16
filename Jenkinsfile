pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh 'cd SampleWebApp mvn test'
            }
        }
        stage('Build & Complie') {
            steps {
                sh 'cd SampleWebApp && mvn clean package'
            }
        }
        
        stage('Deploy to Tomcat Web Server') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'be056470-ea7c-41a7-9a37-f7ee8aba6a9d', path: '', url: 'http://13.59.41.58:8080/')], contextPath: 'app', war: '**/*.war'
            }
        }
    }
}
