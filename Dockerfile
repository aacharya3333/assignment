# Use the devopsedu/webapp image as the base
FROM devopsedu/webapp
FROM php:8.0-apache 

# Install git to clone the repository
RUN apt-get update -y && apt-get install git -y 

# Clone the PHP application repository
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/edureka-devops/projCert.git /var/www/html
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html && mv /var/www/html/website/* /var/www/html



# Expose port 80 (default for web applications)
EXPOSE 8080

CMD ["apache2-foreground"]
