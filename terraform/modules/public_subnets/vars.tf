variable "vpc_id" {}

variable "public_a_cidr" {}

variable "public_b_cidr" {}

variable "public_c_cidr" {}

variable "name" {}

variable "public_a_tag" {
    type = map
}

variable "public_b_tag" {
    type = map
}

variable "public_c_tag" {
    type = map
}