# Configure the AWS Provider
provider "aws" {
  version    = "~> 3.0"
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

// Resources

resource "aws_network_interface" "tf-demo" {
  subnet_id       = aws_subnet.app-subnet.id
  security_groups = [aws_security_group.app_sg.id]

  tags = {
    Name = "primary_network_interface"
  }
}

// Data sources

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
