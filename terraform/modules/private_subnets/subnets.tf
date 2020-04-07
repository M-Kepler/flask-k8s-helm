resource "aws_subnet" "private-a" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_a_cidr
  map_public_ip_on_launch = false
  availability_zone = "eu-west-2a"

  tags = merge({
    Name = "private/${var.name}-a"
    "kubernetes.io/role/internal-elb" = 1
  },
  var.private_a_tag)
}

resource "aws_subnet" "private-b" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_b_cidr
  map_public_ip_on_launch = false
  availability_zone = "eu-west-2b"

  tags = merge({
    Name = "private/${var.name}-b"
    "kubernetes.io/role/internal-elb" = 1
  },
  var.private_b_tag)
}

resource "aws_subnet" "private-c" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_c_cidr
  map_public_ip_on_launch = false
  availability_zone = "eu-west-2c"

  tags = merge({
    Name = "private/${var.name}-c"
    "kubernetes.io/role/internal-elb" = 1
  },
  var.private_c_tag)
}


