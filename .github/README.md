# 🚀 Github Action
A. Create GitLab or GitHub repository
• Add files from your previous task (Dockerfile, Docker Compose, etc.)
• Try your best to do the best practice
• Push your file to the git repository
B. Continuous Integration

• Add .gitlab-ci.yml to your git repository
• In that .gitlab-ci.yml, you need to create 2 jobs, one for building and the other is for
deploying. When there's a commit in the Dockerfile, Gitlab needs to run build and deploy
jobs, and when there's a commit in Docker-compose file, Gitlab only needs to run deploy jobs

## 📦 Project Structure

├── .github         
    ├── workflows     
        ├── ci-cd.yaml
             
## 📖 Description

This project uses GitHub Actions to implement a CI/CD pipeline triggered by changes to the `Dockerfile` and `docker-compose.yaml` on all paths.

The workflow consists of two jobs: build and deploy. The build job runs only when the `Dockerfile` is modified and is responsible for building the Docker image. The deploy job runs when either the `docker-compose.yaml` is changed. If the Dockerfile is updated, deployment runs after the build; otherwise, it runs directly.

Since this use github actions, the result will be found in actions tab in github repo page.

## ⚙️ Requirements

Access on github **https://github.com/xannisa/oreo/tree/main**

## 🧱 Run github Task

This task is run automatically when `Dockerfile` and `docker-compose.yaml` is changed. The result will be found in action tab.


