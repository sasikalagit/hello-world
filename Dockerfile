FROM httpd:2.4
COPY /webapp/target/*.war /usr/local/apache2/htdocs/
