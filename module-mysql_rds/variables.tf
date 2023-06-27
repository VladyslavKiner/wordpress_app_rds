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

variable "engine-version" {
  type = string

}

variable "parameter_group_name" {
  type = string

}

variable "sg_id" {
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

variable "subnet_ids" {
  type = list(any)

}