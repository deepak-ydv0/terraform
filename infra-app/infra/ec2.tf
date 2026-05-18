resource "aws_key_pair" "my_key_pair" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("../terra-key-ec2.pub")

  tags = {
    Name = "${var.env}-infra-app-key"
  }
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-security-group"
  description = "Security group for ${var.env} EC2 instance"
  vpc_id      = aws_default_vpc.default.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-infra-app-security-group"
  }
}

resource "aws_instance" "my_instance" {
  count           = var.instance_count
  security_groups = [aws_security_group.my_security_group.name]
  ami             = var.ec2_ami_id
  instance_type   = var.instance_type

  root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.env}-infra-app-instance-${count.index + 1}"
    Environment = var.env
  }

}
