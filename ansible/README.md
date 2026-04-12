# 🚀 Ansible
• Create an Ansible deployment and environment file
• In your Ansible deployment, it will force update Docker Compose
• In your Ansible environment file, create a connection to target server using the SSH key

## 📦 Project Structure
.
├── deploy.yml          
├── inventory.ini       
├── docker-compose.yml  
             
## 📖 Description

In this Ansible folder, there is a deploy.yml playbook which contains tasks to automate the deployment of a Docker Compose application to a target server. The playbook is responsible for preparing the environment, copying required files, pulling the latest Docker images, and forcing containers to be recreated to ensure the application is always up to date.

The inventory.ini file is used as the environment configuration to define the target server connection. It connects to the remote server using an SSH key, specifying the host address, user, and private key path to ensure secure and passwordless authentication.

The Docker Compose file is deployed to the target server and executed remotely through Ansible. The playbook will run Docker Compose commands such as pulling updated images and recreating containers.

## ⚙️ Requirements

Make sure the following are installed:
Ansible (>= 2.9)
Docker
Docker Compose (docker compose)
SSH access to target server


