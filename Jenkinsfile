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
                deploy adapters: [tomcat9(credentialsId: '603bbdfb-0497-4559-84ae-f5166d35a697', path: '', url: 'http://18.221.54.55:8080/')], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }
}
