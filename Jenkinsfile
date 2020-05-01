node{
    
    stage('git checkout'){
        git url: 'https://github.com/mechdeveloper/cicd-pipeline-war.git'
        
    }
    stage('clean up'){
       def mavenHome = tool name: 'maven3', type: 'maven'
       def mavenCMD = "${mavenHome}/bin/mvn"
       sh "${mavenCMD} clean"
    }
    stage('build, test and package'){
       def mavenHome = tool name: 'maven3', type: 'maven'
       def mavenCMD = "${mavenHome}/bin/mvn"
       sh "${mavenCMD} package"
    }
    stage('Deploy Tomcat'){
        sh "rm -r '/opt/tomcat/webapps/ROOT'"
        sh "cp 'target/ROOT.war' '/opt/tomcat/webapps'"
    }
    stage('Test Deployment'){
        sh "curl http://localhost:8080"
    }
}