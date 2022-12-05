FROM httpd:2.4:latest
COPY /webapp/target/*.war /usr/local/apache2/htdocs/
