FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
Copy /var/lib/jenkins/workspace/New_pipeline/webapp/target/webapp.war .
