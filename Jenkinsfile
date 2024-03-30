pipeline {

    agent none
    environment {
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }
    stages {
        stage("build iamge"){
            
        }
        stage('Deploy container') {
           agent{
                docker {
                    image 'khaliddinh/ansible'
                }
            }
            steps {
                withCredentials([file(credentialsId: 'ansible_key', variable: 'ansible_key')]) {
                    sh 'ls -la'
                    sh "cp /$ansible_key ansible_key"
                    sh 'cat ansible_key'
                    sh 'ansible --version'
                    sh 'ls -la'
                    sh 'chmod 400 ansible_key '
                    sh 'ansible-playbook -i hosts --private-key ansible_key playbook.yml'
            }
            }
        }
        
    }
    post {
        // Clean after build
        always {
            cleanWs()
        }
    }
}