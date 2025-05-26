locals {
  vpc_cidr_block  = data.aws_vpc.current.cidr_block
  vpc_cidr_blocks = data.aws_vpc.current.cidr_block_associations[*].cidr_block

  subnet_cidr_blocks        = { for k, v in data.aws_subnet.details : k => v.cidr_block }
  subnet_availability_zones = { for k, v in data.aws_subnet.details : k => v.availability_zone }

  subnetting_example = cidrsubnets(local.vpc_cidr_block, 4, 4)
  
  # Network calculations based on provided variables
  network_calculations = {
    base_cidr          = var.cidr_block
    subnet_count       = var.subnet_count
    subnet_bit_mask    = var.subnet_bit_mask
    network_address    = cidrhost(var.cidr_block, 0)
    network_mask       = cidrnetmask(var.cidr_block)
    ip_count           = pow(2, 32 - tonumber(split("/", var.cidr_block)[1]))
    usable_ip_count    = pow(2, 32 - tonumber(split("/", var.cidr_block)[1])) - 2
    calculated_subnets = [
      for i in range(var.subnet_count) : {
        cidr        = cidrsubnet(var.cidr_block, var.subnet_bit_mask - tonumber(split("/", var.cidr_block)[1]), i)
        net_address = cidrhost(cidrsubnet(var.cidr_block, var.subnet_bit_mask - tonumber(split("/", var.cidr_block)[1]), i), 0)
        mask        = cidrnetmask(cidrsubnet(var.cidr_block, var.subnet_bit_mask - tonumber(split("/", var.cidr_block)[1]), i))
        first_ip    = cidrhost(cidrsubnet(var.cidr_block, var.subnet_bit_mask - tonumber(split("/", var.cidr_block)[1]), i), 1)
        last_ip     = cidrhost(cidrsubnet(var.cidr_block, var.subnet_bit_mask - tonumber(split("/", var.cidr_block)[1]), i), pow(2, 32 - var.subnet_bit_mask) - 2)
        ip_count    = pow(2, 32 - var.subnet_bit_mask)
        usable_ips  = pow(2, 32 - var.subnet_bit_mask) - 2
      }
    ]
  }
}
