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
                deploy adapters: [tomcat9(credentialsId: 'tomcatSERVER', path: '', url: 'http://3.128.201.165:8080/')], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }
}
