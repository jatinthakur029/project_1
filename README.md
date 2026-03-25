# Project_1

This is my first project, a simple web application deployment on AWS using Terraform and shell scripting.

## Overview

This project automates the deployment of an Ubuntu EC2 instance on AWS, installs Apache web server, and deploys a website template.

## Components

- **Terraform**: Infrastructure as Code for provisioning AWS resources
- **Shell Script**: For server configuration and software installation
- **Configuration Files**: AWS and application settings

## Features

- Automated EC2 instance creation
- Security group configuration for SSH and HTTP access
- Remote provisioning of Apache and website deployment
- Key pair management for secure access

## Getting Started

1. Configure AWS credentials
2. Initialize Terraform: `terraform init`
3. Plan the deployment: `terraform plan`
4. Apply the changes: `terraform apply`

## Requirements

- AWS account
- Terraform installed
- SSH key pair