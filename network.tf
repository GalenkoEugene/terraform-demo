
resource "aws_vpc" "app-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "tf-demo"
  }
}

resource "aws_eip" "app-eip" {
  count      = var.instance_count
  instance   = element(aws_instance.server.*.id, count.index)
  vpc        = true
  depends_on = [aws_instance.server]
}
