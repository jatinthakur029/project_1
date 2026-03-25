variable "region" {
  default = "us-east-1"
}

variable "zone" {
  default = "us-east-1a"
}

variable "aws_key_pair" {
  default = "project_1key"
}

variable "amiID" {
    type = map(any)
    default = {
      us-east-1="ami-04680790a315cd58d"
    }
  
}