# GitLAB
Workflow

to see built images to go Deploy --> Container Registry

Link to install github runner [install/linux-repository](https://docs.gitlab.com/runner/install/linux-repository.html)

***Install git lab runner***

curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"

```
# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -O -L https://github.com/actions/runner/releases/download/v2.304.1/actions-runner-linux-x64-2.304.1.tar.gz
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.304.1.tar.gz
```

## Generate a Personal Access Token on GitLab:
Log in to your GitLab account on the GitLab website.
Go to "Settings" > "Access Tokens" (left sidebar).
docker login registry.gitlab.com -u <YOUR_GITLAB_USERNAME> -p <YOUR_ACCESS_TOKEN>

go to : [container_registry Link: ](https://gitlab.com/aphhc/angelpalms-project/container_registry)


## Get GitLab runner token

![runner1](photos/runner1.png)

```
docker login registry.gitlab.com
docker build -t registry.gitlab.com/aphhc/angelpalms-project .
docker push registry.gitlab.com/aphhc/angelpalms-project
```

***to see built images to go*** Deploy --> Container Registry


```
docker build -t ubuntu-gitlab-runner .
docker run -d --name my-ubuntu-gitlab-runner ubuntu-gitlab-runner
```

