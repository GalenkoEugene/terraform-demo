
resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  count         = var.instance_count
  key_name      = var.ami_key_pair_name

  network_interface {
    network_interface_id = aws_network_interface.tf-demo.id
    device_index         = count.index
  }

  tags = {
    Name        = "tf-demo"
    Description = "Simple ec2 instance"
  }
}
