provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "web" {
  ami  = var.ami
  instance_type = var.instance_type
  user_data = file("userdata.tpl")
  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name = "Web Server"
  }
}

resource "aws_security_group" "web" {
  name = "web_traffic"
  description = "Allow Web Traffic"
  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "Allow HTTP traffic"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "web_traffic"
  }
}
