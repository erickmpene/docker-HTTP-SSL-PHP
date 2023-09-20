# docker-HTTP-SSL-PHP
#### For this project I used a centos image based on systemd. The image to use must be built from the centos:7 image. For more details, you can go to the Docker Hub to see instructions for building a systemd-based centos image.

#### 1. Dockerfile for systemd base image
```sh
FROM centos:7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
```
```sh
docker build --rm -t local/c7-systemd .
```
#### 2. systemd enabled app container
```sh
FROM local/c7-systemd
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
EXPOSE 80
CMD ["/usr/sbin/init"]
```
```sh
docker build --rm -t local/c7-systemd-httpd .
```
#### 3. First Create your keys
```sh
openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout MyKey.key -out MyKey.crt
```
#### 4. Now you can use the image you created previously
```sh

```