resource "aws_instance" "project_1" {
  ami                    = var.amiID[var.region]
  instance_type          = "t3.micro"
  key_name               = var.aws_key_pair
  availability_zone      = var.zone
  vpc_security_group_ids = [aws_security_group.project_1-sg.id]

  provisioner "remote-exec" {
    inline = [
      "#!/bin/bash",
      "sudo apt update",
      "sudo apt install wget unzip apache2 -y",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "sudo wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip",
      "sudo unzip -o 2117_infinite_loop.zip",
      "sudo cp -r 2117_infinite_loop/* /var/www/html/",
      "sudo systemctl restart apache2"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/project_1key")
      host        = self.public_ip
    }
  }

  timeouts {
    create = "10m"
  }

  tags = {
    Name = "project_1"
  }
}

resource "aws_ec2_instance_state" "name" {
  instance_id = aws_instance.project_1.id
  state       = "running"
}