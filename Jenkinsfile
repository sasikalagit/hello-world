node {
	def application = "helloworld"
	def dockerhubaccountid = "isasalakr"
	def mvnHome = tool 'mymaven'
	
	stage('Clone repository') {
		checkout scm
		mvnHome = tool 'mymaven'
	}
        stage('Build maven') {
             sh "'${mvnHome}/bin/mvn' clean install"
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
	
	stage('Remove running container'){
	       sh "docker rm -f \$(docker ps -aq) || true"  
	       
        }

	stage('Deploy') {
		sh ("docker run -d -p 81:8080 -v /var/log/:/var/log/ ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}
	
	stage('Remove old images') {
		// remove docker pld images
		sh("docker rmi ${dockerhubaccountid}/${application}:latest -f")
   }
}
