variable "instance_type" {}
variable "key_name" {}
variable "vpc_security_group_ids" {
  type = list
}
variable "subnet_id" {}
variable "user_data_base64" {}
variable "iam_instance_profile" {}
variable "tags" {}
variable "root_volume_size" {}