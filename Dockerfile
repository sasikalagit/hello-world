FROM httpd:2.4
COPY /webapp/target/webapp.war /usr/local/apache2/htdocs/
