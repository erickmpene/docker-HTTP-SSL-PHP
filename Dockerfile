FROM local/c7-systemd

RUN yum -y install \
      httpd \
      php \
      mod_ssl \
      openssl \
      php-mysql; \
      yum clean all; \
      systemctl enable httpd.service

COPY MyKey.key /etc/pki/tls/private
COPY MyKey.crt /etc/pki/tls/certs
COPY ssl.conf /etc/httpd/conf.d/default.conf

EXPOSE 80
COPY biggy /var/www/html

CMD apachectl -DFOREGROUND