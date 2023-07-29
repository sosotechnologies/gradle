# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install dependencies and GitLab Runner
RUN apt-get update \
    && apt-get install -y curl git \
    && curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash \
    && apt-get install -y gitlab-runner

# Clean up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Start the GitLab Runner service
ENTRYPOINT ["gitlab-runner", "run", "--working-directory=/home/gitlab-runner"]
