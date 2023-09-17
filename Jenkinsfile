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
                deploy adapters: [tomcat9(credentialsId: 'july_tomcat_server', path: '', url: 'http://52.15.93.191:8080')], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }
}
