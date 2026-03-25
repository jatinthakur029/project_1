# Create AWS key pair for SSH access to instances
resource "aws_key_pair" "project_1key" {
  key_name   = "project_1key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQVH101Ppsr1Sn4unCFuI7UKInLXN74h2b8fnXXjNJ6 Jatin Thakur@LAPTOP-UIATE0ET"
}