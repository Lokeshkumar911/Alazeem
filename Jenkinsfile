pipeline{
    agent any
    stages {
        stage('code'){
            steps{
                git url : 'https://github.com/Lokeshkumar911/Alazeem.git', branch : 'master'
            }
        }
        stage('build && test'){
            steps {
                
                sh 'docker build . -t trainwithlokesh/alazeem:latest'
                echo 'test successful'
            }
        }
        stage('login and pusg'){
            steps {
               withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerPass', usernameVariable: 'dockerUser')]){
                  sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"  
                  sh "docker push trainwithlokesh/alazeem:latest"
                   
               }
                
            }
        }
        stage('deploy'){
            steps {
                //sh 'docker --rm alazeem'
                //sh 'sleep 10'
                //sh 'docker run  -d  -p 80:80 --name alazeem  alazeem:latest'
                sh 'docker-compose down && docker-compose up -d'
                echo "deploy"
            }
        }
    }
}
