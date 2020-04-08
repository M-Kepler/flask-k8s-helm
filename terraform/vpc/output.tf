output "vpc_id" {
    value = module.vpc.vpc_id
}

output "vpc_cidr" {
    value = var.vpc_cidr
}

output "subnet_public_a_id" {
    value = module.public_subnets.a_id
}

output "subnet_public_b_id" {
    value = module.public_subnets.b_id
}

output "subnet_public_c_id" {
    value = module.public_subnets.c_id
}

output "subnet_app_a_id" {
    value = module.app_subnets.a_id
}

output "subnet_app_b_id" {
    value = module.app_subnets.b_id
}

output "subnet_app_c_id" {
    value = module.app_subnets.c_id
}

output "office_sg_id" {
    value = aws_security_group.office.id
}