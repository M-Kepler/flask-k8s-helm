module "bastion" {
  source = "../modules/ec2"

  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deleteit.key_name
  vpc_security_group_ids = [ data.terraform_remote_state.vpc.outputs.office_sg_id ]
  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_public_a_id
  user_data_base64       = ""
  iam_instance_profile   = ""
  tags                   = {
    Name = "vpc bastion"
  }
  root_volume_size       = 30
}