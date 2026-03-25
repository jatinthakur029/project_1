resource "aws_instance" "project_1" {
  ami                    = var.amiID[var.region]
  instance_type          = "t3.micro"
  key_name               = var.aws_key_pair
  availability_zone      = var.zone
  vpc_security_group_ids = [aws_security_group.dove-sg.id]

  provisioner "file" {
    source      = "../scripts/web.sh"
    destination = "/tmp/web.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("project_1key")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("project_1key")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "project_1"
  }
}

resource "aws_ec2_instance_state" "name" {
  instance_id = aws_instance.project_1.id
  state       = "running"
}