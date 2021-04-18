
resource "aws_internet_gateway" "app-gw" {
  vpc_id = aws_vpc.app-vpc.id

  tags = {
    Name = "tf-demo"
  }
}
