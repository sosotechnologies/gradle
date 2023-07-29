# create 
- a custom gitlab-runner for a docker executor
- dockerfile
- .gitlab-ci.yml

## Step 1: Create a Dockerfile for the Custom GitLab Runner
Create a file named Dockerfile with the following content:

```Dockerfile
# Use the official GitLab Runner base image
FROM gitlab/gitlab-runner:latest

# Install Docker inside the runner container
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates curl software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce

# Provide Docker access to the GitLab Runner user
RUN usermod -aG docker gitlab-runner

# Clean up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*
```

This Dockerfile extends the official GitLab Runner image and installs Docker inside the container, allowing the runner to use Docker as an executor.

## Step 2: Build the Custom GitLab Runner Image
Build the custom GitLab Runner image using the following command in the same directory as the Dockerfile:

```
docker login registry.gitlab.com
docker build -t cafanwi-custom-gitlab-runner .
docker tag cafanwi-custom-gitlab-runner registry.gitlab.com/0721group/soso-docker-ubumtu-runner-project:1.0.0
docker push registry.gitlab.com/0721group/soso-docker-ubumtu-runner-project:1.0.0
```

OR ***Build with my GitLab Group and project repository***

```
docker login registry.gitlab.com
docker build -t registry.gitlab.com/0721group/soso-docker-ubumtu-runner-project:1.0.0 .
docker push registry.gitlab.com/0721group/soso-docker-ubumtu-runner-project:1.0.0 
```

## Step 3: Create .gitlab-ci.yml
Create a [.gitlab-ci.yml](.gitlab-ci.yml) file in your GitLab repository with the following content:

***- Test Build with this simple pipeline script***
***- Dockerfile not required in the directory for this test***

```yml
stages:
  - build

variables:
  DOCKER_IMAGE: "alpine:latest"
  CUSTOM_RUNNER_IMAGE: "registry.gitlab.com/0721group/soso-docker-ubumtu-runner-project:1.0.0"

build:
    image: alpine
    stage: build
    script:
        - echo "Hello Docker" > index.html
    artifacts:
        paths:
            - index.html 
```

NEXT: 
***- Test Build with a more complex pipeline script***
***- You will need to add a Dockerfile in the directory/sub-directory for this test***

```yml
stages:
  - build

variables:
  DOCKER_IMAGE: "alpine:latest"
  CUSTOM_RUNNER_IMAGE: "registry.gitlab.com/0721group/soso-docker-ubumtu-runner-project:1.0.0"

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker build -t $DOCKER_IMAGE .
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker push $DOCKER_IMAGE

test:
  stage: build
  image: $CUSTOM_RUNNER_IMAGE
  script:
    - docker pull $DOCKER_IMAGE
    - docker run --rm $DOCKER_IMAGE sh -c "echo 'Hello, Docker Executor!'"
```



docker login registry.gitlab.com -u sosotech2000 -p glpat-zER5S_z54KF14bgxzqRs