AWS_REGION = "eu-west-2"

vpc_cidr = "10.10.0.0/16"
vpc_name = "demo-vpc"
vpc_tags = {
    "kubernetes.io/cluster/demo-cluster" = "shared"
}

public_a_cidr = "10.10.1.0/24"
public_b_cidr = "10.10.2.0/24"
public_c_cidr = "10.10.3.0/24"
public_subnet_tags = {
    "kubernetes.io/cluster/demo-cluster" = "shared"
}

app_a_cidr = "10.10.11.0/24"
app_b_cidr = "10.10.12.0/24"
app_c_cidr = "10.10.13.0/24"
app_subnet_tags = {
    "kubernetes.io/cluster/demo-cluster" = "shared"
}

office_ip = ["61.220.65.15/32", "61.220.65.13/32"]