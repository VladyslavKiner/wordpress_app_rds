variable "sg-description" {
  type = list(any)

}

variable "sg-name" {
  type = list(any)

}

variable "sg-tag" {
  type = list(any)

}

variable "vpc-id" {
  type = string

}

variable "ingress_ports" {
  type = map(any)

}
