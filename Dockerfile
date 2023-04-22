FROM httpd
COPY .  /usr/local/apache2/htdocs/
EXPOSE 8000:8000
