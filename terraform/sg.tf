resource "aws_security_group" "project_1-sg" {
  name        = "project_1-sg"
  description = "project_1-sg"


  tags = {
    Name = "project_1-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_from_my_ip" {
  security_group_id = aws_security_group.project_1-sg.id
  cidr_ipv4         = "0.0.0.0/0" # string, not a list
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv6_from_anywhere" {
  security_group_id = aws_security_group.project_1-sg.id
  cidr_ipv6         = "::/0" # fixed: was IPv4 address in ipv6 field, and not a list
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.project_1-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.project_1-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}