variable "cidr_block" {
  type = string

}

variable "vpc-name" {
  type = string

}

variable "pub-subnet-cidrs" {
  type = list(any)

}

variable "pub-subnet-name" {
  type = string

}

variable "az" {
  type = list(any)

}

variable "pvt-subnet-cidrs" {
  type = list(any)
}

variable "pvt-subnet-name" {
  type = string

}

variable "rt-pub-name" {
  type = string

}

variable "igw_name" {
  type = string

}