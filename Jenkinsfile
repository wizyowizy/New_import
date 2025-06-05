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


        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Deploy to Tomcat Web Server') {
            steps {
                deploy adapters: [
                    tomcat9(
                        credentialsId: 'passwordtomcat2', 
                        path: '', 
                        url: 'http://52.14.197.116:8080/'
                    )
                ], contextPath: 'webapp', war: '"**/*.war"'
            }
        }
    }
}
