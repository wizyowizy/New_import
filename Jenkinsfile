pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh 'cd SampleWebApp mvn test'
            }
        }
        stage('Build') {
            steps {
                sh 'cd SampleWebApp && mvn clean package'
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'ID_tomcatServer', path: '', url: 'http://3.16.68.112:8080')], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }
}
