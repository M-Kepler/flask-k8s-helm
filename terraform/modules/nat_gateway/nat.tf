##### Az - A
## Allocate EIP for NAT Gateway
resource "aws_eip" "nat-a" {
    vpc = true

    tags = {
        Name = "${var.vpc_name}/NAT-A-EIP"
    }
}

## NAT Gateway - 1a
resource "aws_nat_gateway" "nat-a" {
    allocation_id = aws_eip.nat-a.id
    subnet_id = var.subnet_a_id

    tags = {
        Name = "${var.vpc_name}/nat-a"
    }
}


###### AZ - B
## Accolate EIP for NAT Gateway
resource "aws_eip" "nat-b" {
    vpc = true

    tags = {
        Name = "${var.vpc_name}/NAT-B-EIP"
    }
}

## NAT Gateway - 1b
resource "aws_nat_gateway" "nat-b" {
    allocation_id = aws_eip.nat-b.id
    subnet_id = var.subnet_b_id

    tags = {
        Name = "${var.vpc_name}/nat-b"
    }
}


###### AZ - C
## Accolate EIP for NAT Gateway
resource "aws_eip" "nat-c" {
    vpc = true

    tags = {
        Name = "${var.vpc_name}/NAT-C-EIP"
    }
}

## NAT Gateway - 1c
resource "aws_nat_gateway" "nat-c" {
    allocation_id = aws_eip.nat-c.id
    subnet_id = var.subnet_c_id

    tags = {
        Name = "${var.vpc_name}/nat-c"
    }
}