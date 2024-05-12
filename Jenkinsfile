pipeline {
    agent any

    stages {   
        stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        
        }

        stage('Build with maven') {
            steps {
                sh 'cd SampleWebApp && mvn clean install'
            }
        }
        
        
        stage('Quality Code Scan Analysis') {
           steps {
                  withSonarQubeEnv('sonar_server') {
             sh "mvn -f SampleWebApp/pom.xml sonar:sonar"     
               }
            }
       }

        
        stage('Push to Nexus Artifactory') {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'SampleWebApp', classifier: '', file: 'SampleWebApp/target/SampleWebApp.war', type: 'war']], credentialsId: 'nexusID', groupId: 'SampleWebApp', nexusUrl: '3.145.69.7:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '1.0-SNAPSHOT'
            }   
            
        }
        
        stage('deploy to tomcat') {
          steps {
            deploy adapters: [tomcat9(credentialsId: 'ID_tomcatServer', path: '', url: 'http://3.17.159.101:8080/')], contextPath: 'app', war: '**/*.war'
             
            }
            
        }
            
    }
} 
