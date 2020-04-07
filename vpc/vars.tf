variable "AWS_REGION" {
    default = "eu-west-2"
    description = "Region"
}

## VPC
variable "vpc_cidr" {
    description = "VPC CIDR"
}
variable "vpc_name" {
    description = "VPC Name"
}
variable "vpc_tags" {}

## Public Subnets
variable "public_a_cidr" {}
variable "public_b_cidr" {}
variable "public_c_cidr" {}
variable "public_subnet_tags" {}

## APP_Subnets
variable "app_a_cidr" {}
variable "app_b_cidr" {}
variable "app_c_cidr" {}
variable "app_subnet_tags" {}

## Office IP
variable "office_ip" {
    type = list
}