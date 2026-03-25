resource "aws_instance" "project_1" {
    ami = var.amiID[var.region]
    instance_type = "t3.micro"
    key_name = var.aws_key_pair
    region = var.region
    availability_zone = var.zone
    vpc_security_group_ids = [aws_security_group.dove-sg.id] 
}


resource "aws_ec2_instance_state" "name" {
    instance_id = aws_instance.project_1.id
    state = "running"
  }