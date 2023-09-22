# Build an Image with HTTP+SSLTLS+PHP

#### For this project I used a centos image based on systemd. The image to use must be built from the centos:7 image. For more details, you can go to the Docker Hub to see instructions for building a systemd-based centos image.

#### For creating a centos image with systemd, you can use docker-compose v3 or use each Dockerfile in the build-1 and build-2 folder. 

### A. With Dockerfile
#### 1. Dockerfile for systemd base image
```sh
docker build -t local/c7-systemd -f build-1/Dockerfile .
```
#### 2. First Create your keys
```sh
cd build-2
openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout MyKey.key -out MyKey.crt
```
/!\ To create the keys, when the prompt asks you for the "Common Name", you will need to enter either the private/public IP address or the domain name of the server.

#### 3. Now we can use the image you created previously for build your image
```sh
cd ../
docker build -t myimage:v1 -f build-2/Dockerfile .
```
##### 5. Run container to test image
```sh
docker run --name mycontainer -d -p 443:443 myimage:v1
```
### B. With docker-compose v3
just run :
```sh
docker compose up -d 
```
Know that docker will also create containers for the build-1 and build-2 services

#### Enjoy ! d(-_-)b