Pipeline 
{
    agent any
    stages
    {
    stage('Clone'){
        steps{
            github:'https://github.com/manojkumar988/javaproject_Dev'

        }
    }
      
    stage('Build'){
        steps{
            sh 'mvn package'
        }
    }
    stage('test'){
        steps{
            sh 'mvn test'
        }
    }
    stage('Docker-Build'){
        steps{
            sh 'docker build javaproject_Dev .'
        }
    }
    stage('Docker-tag'){
        steps{
            sh 'docker tag javaproject_Dev/manojkumar988:v0.1'
        }
    }
    stage('Docker-Push'){
        steps{
            sh 'docker push javaproject_Dev'
        }
    }
    stage('Deploy'){
        steps{
            sh 'k8-cluster-Continental_Server'
        }
    }
    stage(Successfully completed Deploy){
        steps{
            echo 'Sucessfully completed Deployment'
        }
    }            
    
}
}



pipeline
{
    agent any

    stages
    {
        stage('Clone'){
            steps{
                githubURL:
            }
        }
        stage('Build'){
            steps{
                sh 'mvn cleanpackage'
            }
        }
        stage('test'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Deploy'){
            steps{
                echo 'Deploying a java app'
            }
        }
    }
}    