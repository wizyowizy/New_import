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
                sh 'cd SampleWebApp && mvn clean install'
            }
        }

        stage('Quality Code Scan Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                sh "mvn -f clean verify SampleWebApp/pom.xml sonar:sonar"
            }
        }

        }


        
        stage('Deploy to Tomcat Web Server') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcatID', path: '', url: 'http://3.82.26.12:8080')], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }

}
