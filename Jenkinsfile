pipeline {
    agent any

    stages {
        stage('Test stage 1') {
            steps {
                sh 'cd SampleWebApp mvn test'
            }
        }
        stage('Complie the Java Code stage 2') {
            steps {
                sh 'cd SampleWebApp && mvn clean package'
            }
        }
     
        
        stage('Deploy to Tomcat Web Server') {
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'passwordtomcat', path: '', url: 'http://18.191.20.104:8080/')], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }

}
