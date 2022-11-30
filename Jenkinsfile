node {
	def application = "helloworld"
	def dockerhubaccountid = "isasalakr"
	stage('Clone repository') {
		checkout scm
	}
	agent any
	tools {
        maven 'mymaven'
    }
        stage('Build maven') {
            step {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sasikalagit/hello-world.git']]])
                sh 'mvn clean install'
            }
        }
    
	stage('Build image') {
		app = docker.build("${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}
	
	stage('Push image') {
		withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
		app.push()
		app.push("latest")
	}
	}

	stage('Deploy') {
		sh ("docker run -d -p 8081:8080 -v /var/log/:/var/log/ ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}
	
	stage('Remove old images') {
		// remove docker pld images
		sh("docker rmi ${dockerhubaccountid}/${application}:latest -f")
   }
}
