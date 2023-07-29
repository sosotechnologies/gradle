To create a custom Ubuntu-based Docker image for GitLab Runner and set up a pipeline to run a job using this custom image, follow these steps:

Step 1: Create a Dockerfile for the custom GitLab Runner image
Create a file named Dockerfile with the following content:

Step 2: Build and Push the custom image to a container registry (Optional)


```
docker login registry.gitlab.com
docker build -t custom-gitlab-runner .
docker tag custom-gitlab-runner registry.gitlab.com/aphhc/angelpalms-project:1.0.0
docker push registry.gitlab.com/aphhc/angelpalms-project:1.0.0
```

***to see built images to go*** Deploy --> Container Registry

