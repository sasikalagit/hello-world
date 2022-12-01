FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
WORKDIR /var/lib/jenkins/workspace/Project_docker_container/webapp/target
Copy ./*.war /var/lib/jenkins/workspace/Project_docker_container
