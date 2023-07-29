# Base image with Java and Git installed
FROM openjdk:11-jdk

# Install GitLab Runner
RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash \
    && apt-get install -y gitlab-runner

# Set the registration token as an environment variable
ENV REGISTRATION_TOKEN "GR1348941YYxHXcAQ-Lxy87AyW5eg"
# Configure GitLab Runner
RUN gitlab-runner register \
    --non-interactive \
    --url "https://gitlab.com/" \
    --registration-token "$REGISTRATION_TOKEN" \
    --executor "shell" \
    --description "Java GitLab Runner" \
    --tag-list "java"

# Set the working directory inside the container
WORKDIR /home/gitlab-runner

# Start the GitLab Runner service
CMD ["gitlab-runner", "run", "--working-directory=/home/gitlab-runner"]
