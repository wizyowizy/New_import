pipeline {
    agent any
    
    environment {
        MAVEN_OPTS = "--add-opens java.base/java.lang=ALL-UNNAMED"
    }

    stages {
        stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        }

        stage('Build & Compile') {
            steps {
                sh 'cd SampleWebApp && mvn clean package'
            }
        }

        stage('Quality Code Scan Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh 'mvn -f SampleWebApp/pom.xml sonar:sonar'
                }
            }
        }

        stage('Deploy to Tomcat Web Server') {
            steps {
                deploy adapters: [
                    tomcat9(
                        credentialsId: 'tomcat_password', 
                        path: '', 
                        url: 'http://18.216.91.139:8080/'
                    )
                ], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }
}
