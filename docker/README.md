# 🐳 Nginx
A. Create a Docker image with packages :
• Nginx
• PHP 8.2
• Using Alpine as a base image
Then, push your Docker image to your Docker Hub private registry
B. Run your previous Docker image
• Add a simple PHP file to echo hello world (you can add more functions if possible)
• Create a Docker Compose file. In that Docker Compose file, use your previous Docker image,
map the Nginx port (port 80) to your host with port 8080

## 📁 Project Structure

docker/
├────nginx/
    ├── nginx.conf
├──php-app/
    ├── index.php
├── Dockerfile
├── docker-compose.yml

## 📖 Description

In this docker folder, there is Dockerfile which contains yaml file to create our base image using Alpine and install packages PHP 8.2. *In this design, Nginx and PHP-FPM is separated into different containers, this method will improves scalability, and aligns with containerization best practices used in production environments.* Nginx container will use base image from nginx alpine version. Then copy the configuration from our local device to the base container image.

nginx.conf and index.php is built for serve simple web-app. php as a backend listen on port 9000 and nginx as a webserver service listen on port 80.

docker compose file will run the base image as a container running on docker platform. The php-fpm container run will expose port 9000. This will serve a container with open port 80 for serving a webserver and it will mapping to host port 8080 so user from browser can access localhost port 8080.

## 🧱 Run Docker Task

**Attention**
Since this task require to push to our own docker hub, then we have to have an account on *https://hub.docker.com*

And ensure our docker is installed and running.

### ⚙️ 1. Create base image and push to docker hub

To create a base image :
``` bash
docker build -t <dockerhubusername>/docker:latest .
```
Login to docker hub :
``` bash
docker login
```

Push the base image to docker hub :
``` bash
docker push <dockerhubusername>/docker:latest
```

*Note : Replace <dockerhubusername> with your own*

### ⚙️ 2. Run the image to be a running container and use the image from docker hub registry

*Since this container is running on the same machine with build the image, so the command will use the image on local instead.*

``` bash
docker compose -d up
```

## 🕯️ Test the docker application

Open your browser, the access ***localhost:8080***

## 🚀 Destroy docker

Push the base image to docker hub :
``` bash
docker compose down
```