## Create VPC and Internet Gateway
module "vpc" {
    source = "../modules/vpc_igw"

    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    tags     = var.vpc_tags
}

## PUBLIC - PUBLIC SUBNETS
module "public_subnets" {
    source = "../modules/public_subnets"

    vpc_id = module.vpc.vpc_id
    public_a_cidr = var.public_a_cidr
    public_b_cidr = var.public_b_cidr
    public_c_cidr = var.public_c_cidr
    public_a_tag = var.public_subnet_tags
    public_b_tag = var.public_subnet_tags
    public_c_tag = var.public_subnet_tags
    name = "public"
}

## APP - PRIVATE SUBNETS
module "app_subnets" {
    source = "../modules/private_subnets"

    vpc_id = module.vpc.vpc_id
    private_a_cidr = var.app_a_cidr
    private_b_cidr = var.app_b_cidr
    private_c_cidr = var.app_c_cidr
    private_a_tag = var.app_subnet_tags
    private_b_tag = var.app_subnet_tags
    private_c_tag = var.app_subnet_tags
    name = "app"
}


##================================================
## Create NAT Gateway for private subnets
module "nat" {
    source = "../modules/nat_gateway"

    vpc_name = var.vpc_name
    subnet_a_id = module.public_subnets.a_id
    subnet_b_id = module.public_subnets.b_id
    subnet_c_id = module.public_subnets.c_id
}
