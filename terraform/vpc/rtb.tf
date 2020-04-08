##==========================================================
## Attach PRIVATE SUBNETS to NAT Gateway
## Route-Table - APP-A
resource "aws_route_table" "app-a" {
    vpc_id = module.vpc.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = module.nat.a_id
    }
    tags = {
      Name = "${var.vpc_name}/rtb-app-a"
  }
}

resource "aws_route_table_association" "nat-a" {
  subnet_id      = module.app_subnets.a_id
  route_table_id = aws_route_table.app-a.id
}


##=========================================================
## Route-Table - APP-B
resource "aws_route_table" "app-b" {
    vpc_id = module.vpc.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = module.nat.b_id
    }

    tags = {
      Name = "${var.vpc_name}/rtb-app-b"
  }
}

resource "aws_route_table_association" "nat-b" {
  subnet_id      = module.app_subnets.b_id
  route_table_id = aws_route_table.app-b.id
}


##=========================================================
## Route-Table - APP-C
resource "aws_route_table" "app-c" {
    vpc_id = module.vpc.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = module.nat.c_id
    }

    tags = {
      Name = "${var.vpc_name}/rtb-app-c"
  }
}

resource "aws_route_table_association" "nat-c" {
  subnet_id      = module.app_subnets.c_id
  route_table_id = aws_route_table.app-c.id
}


##=========================================================
##=========================================================
## Attach Internet Gateway to public subnets
## Route-Table - PUBLIC-A
resource "aws_route_table" "public-a" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.igw_id
  }

  tags = {
    Name = "${var.vpc_name}/rtb-public-a"
  }
}

resource "aws_route_table_association" "igw-a" {
  subnet_id      = module.public_subnets.a_id
  route_table_id = aws_route_table.public-a.id
}


##=========================================================
## Route-Table - PUBLIC-B
resource "aws_route_table" "public-b" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.igw_id
  }

  tags = {
    Name = "${var.vpc_name}/rtb-publics-b"
  }
}

resource "aws_route_table_association" "igw-b" {
  subnet_id      = module.public_subnets.b_id
  route_table_id = aws_route_table.public-b.id
}


##=========================================================
## Route-Table - PUBLIC-C
resource "aws_route_table" "public-c" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.igw_id
  }

  tags = {
    Name = "${var.vpc_name}/rtb-publics-c"
  }
}

resource "aws_route_table_association" "igw-c" {
  subnet_id      = module.public_subnets.c_id
  route_table_id = aws_route_table.public-c.id
}