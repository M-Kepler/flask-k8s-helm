variable "vpc_id" {}

variable "private_a_cidr" {}

variable "private_b_cidr" {}

variable "private_c_cidr" {}

variable "name" {}

variable "private_a_tag" {
  type = map
}

variable "private_b_tag" {
  type = map
}

variable "private_c_tag" {
  type = map
}