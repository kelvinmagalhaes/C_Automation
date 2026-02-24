pipeline {
    agent any
    stages {
        stage('Build e Teste') {
            agent {
                docker {
                    image 'c-automation'
                    reuseNode true
                }
            }
            steps {
                sh 'make test'
                sh './run_build.sh'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '*.txt,challenge', allowEmptyArchive: true
        }
    }
}
