FROM local/c7-systemd

RUN yum -y install \
      httpd \
      php \
      mod_ssl \
      openssl \
      php-mysql; \
      yum clean all; \
      systemctl enable httpd.service

COPY ./build-2/MyKey.key /etc/pki/tls/private
COPY ./build-2/MyKey.crt /etc/pki/tls/certs
COPY ./build-2/ssl.conf /etc/httpd/conf.d/default.conf

COPY ./build-2/biggy /var/www/html
