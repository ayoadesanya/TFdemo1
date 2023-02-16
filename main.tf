provider "aws" {
  region  = "ca-central-1"
  profile = "ayo_profile"
}

resource "aws_instance" "first-instance" {
  ami                    = "ii"
  instance_type          = "t2.micro"
  availability_zone      = "c-central-1a"
  key_name               = "ccentralkp"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

resource "aws_security_group" "allow_ssh" {
  name        = "Allow-SSH"
  description = "Allow SSH Inbound Traffic"
  vpc_id      = "vpc-0b6c81fa33bea8f86"

  ingress {
    description = "Allow-SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["184.144.65.5/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow-SSH"
  }
}
