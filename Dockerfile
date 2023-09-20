#FROM httpd
FROM php:apache

#RUN apt install  php php-mysql -y 

COPY biggy /var/www/html 
RUN echo "<?php phpinfo(); ?>" > /var/www/html/test.php

CMD apachectl -DFOREGROUND
