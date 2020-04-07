## 2 subnets 
resource "aws_subnet" "public-a" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_a_cidr
  map_public_ip_on_launch = true
  availability_zone = "eu-west-2a"

  tags = merge({
    Name = "public/${var.name}-a"
    "kubernetes.io/role/elb" = 1
  },
  var.public_a_tag)
}

resource "aws_subnet" "public-b" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_b_cidr
  map_public_ip_on_launch = true
  availability_zone = "eu-west-2b"

  tags = merge({
      Name = "public/${var.name}-b"
      "kubernetes.io/role/elb" = 1
    },
  var.public_b_tag)
}

resource "aws_subnet" "public-c" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_c_cidr
  map_public_ip_on_launch = true
  availability_zone = "eu-west-2c"

  tags = merge({
      Name = "public/${var.name}-c"
      "kubernetes.io/role/elb" = 1
    },
  var.public_c_tag)
}