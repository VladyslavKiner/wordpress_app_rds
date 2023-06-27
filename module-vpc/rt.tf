resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.custom-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt-pub-name
  }
}

resource "aws_route_table_association" "pub-subnets" {
  count          = length(var.pub-subnet-cidrs)
  subnet_id      = element(aws_subnet.pub-subnet[*].id, count.index)
  route_table_id = aws_route_table.rt-pub.id
}