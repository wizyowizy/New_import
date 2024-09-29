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
                withSonarQubeEnv('sonar') {
                sh "mvn -f SampleWebApp/pom.xml sonar:sonar"
            }
        }

        }

        stage('Push to Nexus Artifacotory') {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'SampleWebApp', classifier: '', file: 'SampleWebApp/target/SampleWebApp.war', type: 'war']], credentialsId: 'nexusID', groupId: 'SampleWebApp', nexusUrl: '3.16.137.45:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '1.0-SNAPSHOT'
            }
        }
        
        stage('Deploy to Tomcat Web Server') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcatSERVER', path: '', url: 'http://3.145.33.206:8080')], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }

}
