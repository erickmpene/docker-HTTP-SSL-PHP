FROM local/c7-systemd

RUN yum -y install \
      httpd \
      php \
      mod_ssl \
      openssl \
      php-mysql; \
      yum clean all; \
      systemctl enable httpd.service



EXPOSE 80



ENTRYPOINT [ "/usr/sbin/init" ]
