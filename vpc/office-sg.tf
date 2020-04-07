## Shared Security Groups

resource "aws_security_group" "office" {
  name        = "allow-office"
  description = "Security Group for Allow Office IPs"
  vpc_id      = module.vpc.vpc_id
  tags        = {
      Name = "allow-office"
  }
}

## =====================Outbound===============================
## Outbound allows all
resource "aws_security_group_rule" "egress" {
  description       = "Allow all egress traffic"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.office.id
  type              = "egress"
}


## =====================Inbound=================================
## Inbound allows for whole VPC
resource "aws_security_group_rule" "ingress" {
  description              = "Allow traffic from office IPs"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  cidr_blocks              = var.office_ip
  security_group_id        = aws_security_group.office.id
  type                     = "ingress"
}