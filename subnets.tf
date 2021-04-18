// cidrsubnet(iprange, newbits, netnum)
// iprange - is the CIDR block of your virtual network,
// newbits - is the new mask for the subnet within the virtual network, and
// netnum  - is the zero-based index of the subnet when the network is masked with the newbit.

resource "aws_subnet" "app-subnet" {
  vpc_id            = aws_vpc.app-vpc.id
  cidr_block        = cidrsubnet(aws_vpc.app-vpc.cidr_block, 3, 1)
  availability_zone = element(var.availability_zone_names, 1)

  tags = {
    Name = "tf-demo"
  }
}

resource "aws_route_table" "app-route-table" {
  vpc_id = aws_vpc.app-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-gw.id
  }
  tags = {
    Name = "tf-demo"
  }
}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.app-subnet.id
  route_table_id = aws_route_table.app-route-table.id
}
