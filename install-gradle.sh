#!/bin/bash

# Define the Gradle version to install
GRADLE_VERSION=8.2

# Download and extract Gradle
wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp
sudo unzip -o -d /opt/gradle /tmp/gradle-${GRADLE_VERSION}-bin.zip

# Set up environment variables
echo "export GRADLE_HOME=/opt/gradle/gradle-${GRADLE_VERSION}" | sudo tee -a /etc/profile.d/gradle.sh
echo "export PATH=\$PATH:\$GRADLE_HOME/bin" | sudo tee -a /etc/profile.d/gradle.sh

# Reload the shell to apply the changes
source /etc/profile.d/gradle.sh

# Verify Gradle installation
gradle -v
