# AWS region for deployment
variable "region" {
  default = "us-east-1"
}

# Availability zone within the region
variable "zone" {
  default = "us-east-1a"
}

# Name of the AWS key pair for SSH access
variable "aws_key_pair" {
  default = "project_1key"
}

# AMI IDs for different regions
variable "amiID" {
  type = map(any)
  default = {
    us-east-1 = "ami-04680790a315cd58d"
  }

}