resource "aws_key_pair" "my_key" {
  key_name   = "terraform-key-ec2"
  public_key = file("./terra-key-ec2.pub")
}

# Default VPC
resource "aws_default_vpc" "default" {

}

# Security Group
resource "aws_security_group" "my_security_group" {
  name        = "automated-security-group"
  description = "Security group for automated EC2 instance"
  vpc_id      = aws_default_vpc.default.id

  # SSH Rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }

  # HTTP Rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from anywhere"
  }

  # Outbound Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "automated-sg"
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  root_block_device {
    volume_size = var.ec2_root_store_size
    volume_type = "gp3"

    tags = {
      Name = "TWS-Jnoon-automate"
    }
  }

  tags = {
    Name = "terraform-ec2-instance"
  }
}
