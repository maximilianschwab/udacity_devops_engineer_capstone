def image

pipeline {
    agent any

    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    docker.image('hadolint/hadolint:latest-debian').inside() {
                            sh 'hadolint ./app/Dockerfile | tee -a hadolint.txt'
                            sh '''
                                lintErrors=$(stat --printf="%s"  hadolint.txt)
                                if [ "$lintErrors" -gt "0" ]; then
                                    echo "Errors linting Dockerfile"
                                    cat hadolint.txt
                                    exit 1
                                else
                                    echo "Done linting Dockerfile"
                                fi
                            '''
                    }
                }
            }
        }

        stage('Build Dockerfile') {
            steps {
                script {
                    image = docker.build("maximilianschwab/devops_capstone", "-f app/Dockerfile app")
                }
            }
        }

        stage('Push Dockerfile') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        image.push("${env.BUILD_NUMBER}")
                        image.push("latest")
                    }
                }
            }
        }

        stage('kubectl config view') {
            steps {
                dir('kubernetes') {
                    withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                            sh 'kubectl config view --kubeconfig=/home/ubuntu/.kube/config'
                        }
                    }
            }
        }

        stage('Print current kubectl context') {
            steps {
                dir('kubernetes') {
                    withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                            sh 'kubectl config current-context --kubeconfig=/home/ubuntu/.kube/config'
                        }
                    }
            }
        }

        stage('Print aws cli configuration') {
            steps {
                dir('kubernetes') {
                    withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                            sh 'aws configure list'
                        }
                    }
            }
        }

        stage('Apply deployment') {
            steps {
                dir('kubernetes') {
                    withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                            sh 'kubectl apply -v=8 -f deployment.yaml --kubeconfig=/home/ubuntu/.kube/config'
                        }
                    }
            }
        }

        stage('Update deployment') {
            steps {
                dir('kubernetes') {
                    withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                            sh 'kubectl set image deployments/devops-capstone devops-capstone=maximilianschwab/devops_capstone:${BUILD_NUMBER} --kubeconfig=/home/ubuntu/.kube/config'
                        }
                    }
            }
        }

        stage('Wait for pods') {
            steps {
                withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                    sh '''
                        ATTEMPTS=0
                        ROLLOUT_STATUS_CMD="kubectl rollout status deployment/devops-capstone --kubeconfig=/home/ubuntu/.kube/config"
                        until $ROLLOUT_STATUS_CMD || [ $ATTEMPTS -eq 60 ]; do
                            $ROLLOUT_STATUS_CMD
                            ATTEMPTS=$((attempts + 1))
                            sleep 10
                        done
                    '''
                }
            }
        }

        stage('Post deployment test') {
            steps {
                withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
                    sh '''
                        HOST=$(kubectl get service service-devops-capstone --kubeconfig=/home/ubuntu/.kube/config | grep 'amazonaws.com' | awk '{print $4}')
                        HOST="$HOST:8080"
                        curl $HOST -f
                    '''
                }
            }
        }

    }
}