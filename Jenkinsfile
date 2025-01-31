pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'sonar-server'  // Set the name of your SonarQube server configuration
    }

    stages {
        stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        }
        
        stage('Build & Compile') {
            steps {
                sh 'cd SampleWebApp && mvn clean install'
            }
        }

        stage('Quality Code Scan Analysis') {
            steps {
                script {
                    // Run SonarQube scan with the configured SonarQube server
                    withSonarQubeEnv(SONARQUBE_SERVER) {
                        sh "mvn -f SampleWebApp/pom.xml sonar:sonar"
                    }
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
