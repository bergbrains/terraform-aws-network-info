data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" "current" {
  default = true
}

data "aws_subnets" "current" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.current.id]
  }
}

data "aws_subnet" "details" {
  for_each = toset(data.aws_subnets.current.ids)
  id       = each.value
}
