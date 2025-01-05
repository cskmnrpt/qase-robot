#!/bin/bash

# Add Google's signing key and Chrome repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/google-chrome.list

# Update package list and install Google Chrome
sudo apt-get update -qqy
sudo apt-get -qqy install google-chrome-stable

# Get Chrome version and determine major version
CHROME_VERSION=$(google-chrome-stable --version)
CHROME_FULL_VERSION=${CHROME_VERSION%%.*}
CHROME_MAJOR_VERSION=${CHROME_FULL_VERSION//[!0-9]}

# Remove Chrome repository after installation
sudo rm /etc/apt/sources.list.d/google-chrome.list

# Download and install matching ChromeDriver
export CHROMEDRIVER_VERSION=`curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_MAJOR_VERSION}`
curl -L -O "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip && chmod +x chromedriver && sudo mv chromedriver /usr/local/bin

# Install additional dependencies required for Selenium and Xvfb
sudo apt-get install -qqy \
    libx11-dev \
    libxcomposite-dev \
    libxdamage-dev \
    libxi6 \
    libgdk-pixbuf2.0-0 \
    libnss3 \
    libasound2 \
    fonts-liberation \
    libappindicator3-1 \
    libnspr4 \
    xdg-utils \
    xvfb  # Install Xvfb for virtual display
