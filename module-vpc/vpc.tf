resource "aws_vpc" "custom-vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc-name
  }
}