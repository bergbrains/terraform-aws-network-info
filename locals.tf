locals {
  vpc_cidr_block  = data.aws_vpc.current.cidr_block
  vpc_cidr_blocks = data.aws_vpc.current.cidr_block_associations[*].cidr_block

  subnet_cidr_blocks        = { for k, v in data.aws_subnet.details : k => v.cidr_block }
  subnet_availability_zones = { for k, v in data.aws_subnet.details : k => v.availability_zone }

  subnetting_example = cidrsubnets(local.vpc_cidr_block, 4, 4)
}
