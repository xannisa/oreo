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
├── Dockerfile
├── nginx.conf
├── index.php
├── docker-compose.yml

## 📖 Description

In this docker folder, there is Dockerfile which contains yaml file to create our base image using Alpine and install packages like Nginx and PHP 8.2. *In the improved design, Nginx and PHP-FPM can be separated into different containers, this method will improves scalability, and aligns with containerization best practices used in production environments.* Then copy the configuration from our local device to the base container image, then set command to run both services.

nginx.conf and index.php is built for serve simple web-app. php as a backend and nginx as a webserver service.

docker compose file will run the base image as a container running on docker platform. The container running will expose internal port 8080. This will serve a container with open port 80 for serving a webserver.

## 🧱 Run Docker Task

To create a base image use this command :
bash```
docker build -t dockerusername/docker:v1 .
```

# 🐳 Nginx + PHP 8.2 Docker Setup (Alpine)

## 📖 Description
This project demonstrates how to:
- Build a Docker image using Alpine Linux
- Install Nginx and PHP 8.2
- Push the image to Docker Hub (private repository)
- Run the container using Docker Compose
- Serve a simple PHP application

---

## 📁 Project Structure