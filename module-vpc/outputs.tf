output "igw_id" {
  value = aws_internet_gateway.igw.id

}

output "pub_subnet_id" {
  value = aws_subnet.pub-subnet[0].id

}

output "pvt_subnet_ids" {
  value = aws_subnet.pvt-subnet[*].id

}

output "vpc-id" {
  value = aws_vpc.custom-vpc.id

}