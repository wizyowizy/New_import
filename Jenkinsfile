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

        stage('Quality Code Scan Analysis') {
            steps {
                withSonarQubeEnv('sonar_server') {
                sh 'mvn SampleWebApp/pom.xml sonar:sonar'
            }
        }

        }

        stage('Push to Nexus Artifacotory') {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'SampleWebApp', classifier: '', file: 'SampleWebApp/target/SampleWebApp.war', type: 'war']], credentialsId: 'nexusID', groupId: 'SampleWebApp', nexusUrl: 'http://3.139.87.205:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '1.0-SNAPSHOTS'
            }
        }
        
        stage('Deploy to Tomcat Web Server') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomat_serverID', path: '', url: 'http://18.188.248.207:8080/')], contextPath: 'webapp', war: '**/*.war'
            }
        }
    }

}
