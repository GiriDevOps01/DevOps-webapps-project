pipeline
{
	agent any
	tools
	{
	maven "maven"
	}
	stages{
		stage('Code Checkout'){
			steps{
				git branch: 'main', url: 'https://github.com/GiriDevOps01/DevOps-webapps-project.git'

			}
		}
		stage('Execute Maven'){
			steps{
				sh 'mvn package'
			}
		}

		stage('War Deploy into Nexus'){
			steps{
				sh 'mvn deploy'
			}
		}


		stage("Copying the War file to Job Location"){
			steps{
				sh 'cp /root/.jenkins/workspace/pipeline-giriprasad/target/*.war /root/.jenkins/workspace/pipeline-giriprasad/' 

		}
	}
	    stage("Docker Image Build"){
			steps{
			sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID . '
			}
	             }
	   stage("Docker Image taging"){
			steps{
			sh 'docker image tag $JOB_NAME:v1.$BUILD_ID giriprasadreddy/$JOB_NAME:v1.$BUILD_ID'
			
		}

		}
		stage("push Image: DOCKERHUB"){
             steps{

                withCredentials([string(credentialsId: 'My-token', variable: 'dockerpassword')]) {
                sh 'docker login -u giriprasadreddy -p ${DockerPassword}'
                sh 'docker image push giriprasadreddy/$JOB_NAME:v1.$BUILD_ID'
                
              }
         }
      }
	}
}



