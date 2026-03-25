#!/bin/bash

# Update package list and install required packages
apt update && apt install wget unzip apache2 -y

# Start and enable Apache service
systemctl start apache2
systemctl enable apache2

# Download the website template
wget https://www.tooplate.com/zip-templates/2153_fireworks_composer.zip

# Unzip the template (overwrite if exists)
unzip -o 2153_fireworks_composer.zip

# Copy template files to web root directory
cp -r 2153_fireworks_composer/* var/www/html

# Restart Apache to apply changes
systemctl restart apache2

