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