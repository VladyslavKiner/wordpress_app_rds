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

variable "pvt-subnet-cidrs" {
  type = list(any)

}

variable "pvt-subnet-name" {
  type = string

}

variable "az" {
  type = list(any)

}

variable "igw_name" {
  type = string

}

variable "rt-pub-name" {
  type = string

}

variable "ingress_ports" {
  type = map(any)

}

variable "sg-description" {
  type = list(any)

}

variable "sg-name" {
  type = list(any)

}

variable "sg-tag" {
  type = list(any)

}

variable "ec2-name" {
  type = string

}

variable "image_id" {
  type = string

}

variable "ssh_key" {
  type = string

}

variable "instance_type" {
  type = string

}

variable "db_instance_type" {
  type = string

}

variable "user" {
  type = string

}

variable "password" {
  type = string

}

variable "identifier" {
  type = string

}

variable "storage-size" {
  type = number
}

variable "storage_type" {
  type = string

}

variable "db_name" {
  type = string

}

variable "engine_version" {
  type = string

}

variable "parameter_group_name" {
  type = string

}