resource "aws_subnet" "pub-subnet" {
  count                                       = length(var.pub-subnet-cidrs)
  vpc_id                                      = aws_vpc.custom-vpc.id
  cidr_block                                  = var.pub-subnet-cidrs[count.index]
  map_public_ip_on_launch                     = true
  enable_resource_name_dns_a_record_on_launch = true

  tags = {
    Name = "${var.pub-subnet-name} ${count.index + 1}"
  }
}

resource "aws_subnet" "pvt-subnet" {
  count             = length(var.pvt-subnet-cidrs)
  vpc_id            = aws_vpc.custom-vpc.id
  cidr_block        = var.pvt-subnet-cidrs[count.index]
  availability_zone = var.az[count.index]

  tags = {
    Name = "${var.pvt-subnet-name} ${count.index + 1}"
  }
}