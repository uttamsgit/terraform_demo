
# VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


# Security Group
resource "aws_security_group" "my_security_group" {
  name        = "Splunk-security-group"
  description = "Allow inbound traffic"
  vpc_id      = aws_default_vpc.default.id  # interpolation

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http open"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Splunk UI open"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instances
resource "aws_instance" "my_instance" {
  key_name     = aws_key_pair.my_key.key_name
  ami           = var.ec2_ami_id # ubuntu 22.04 LTS in eu-west-1
  instance_type = var.ec2_instance_type
  count         = var.aws_instance_count
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  root_block_device {
    volume_size = var.ec2_root_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "Splunk-SH-VM-${count.index}"
  }
}

#key pair login

resource "aws_key_pair" "my_key" {
  key_name   = "splunk-key"
  public_key = file("splunk-key.pub")
}
