#Wordpress docker image with Php 7.4 and Apache
FROM wordpress:5.7.2-php8.0-apache

# wp_data volume
VOLUME /var/www/html
WORKDIR /var/www/html

#Update / VIM
RUN apt update && apt install vim -y

# Ports
EXPOSE 80
EXPOSE 443

# Copy php.ini Over to Container
COPY php.ini /usr/local/etc/php/
COPY phpinfo.php /var/www/html/wp-admin/
COPY .htaccess /var/www/html