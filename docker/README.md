Docker
A. Create a Docker image with packages :
• Nginx
• PHP 8.2
• Using Alpine as a base image
Then, push your Docker image to your Docker Hub private registry
B. Run your previous Docker image
• Add a simple PHP file to echo hello world (you can add more functions if possible)
• Create a Docker Compose file. In that Docker Compose file, use your previous Docker image,
map the Nginx port (port 80) to your host with port 8080

Answers :
In this docker folder, there is Dockerfile which contains yaml file to create our base image using Alpine and install packages like Nginx and PHP 8.2. Then copy the configuration from our local device to the base container image, then set command to run both services.

To create a base image use this command :
bash```
docker build -t dockerusername/docker:v1 .
```