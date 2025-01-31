pipeline {
    agent any

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
                withSonarQubeEnv('sonar-server') {
                sh "mvn -f SampleWebApp/pom.xml sonar:sonar -Dsonar.java.options='--add-opens java.base/java.lang=ALL-UNNAMED'"
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
