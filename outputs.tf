output "current_account_id" {
  description = "AWS Account ID. Example: '123456789012'"
  value       = data.aws_caller_identity.current.account_id
}

output "current_caller_arn" {
  description = "AWS ARN of the identity making the calls. Example: 'arn:aws:iam::123456789012:user/admin'"
  value       = data.aws_caller_identity.current.arn
}

output "current_region" {
  description = "AWS Region in which Terraform is operating. Example: 'us-west-2'"
  value       = data.aws_region.current.name
}

output "current_vpc_id" {
  description = "ID of the current VPC. Example: 'vpc-0abc123456789def0'"
  value       = data.aws_vpc.current.id
}

output "current_vpc_cidr_block" {
  description = "Primary CIDR block of the VPC. Example: '10.0.0.0/16'"
  value       = local.vpc_cidr_block
}

output "current_vpc_cidr_blocks" {
  description = "All CIDR block associations for the VPC. Example: ['10.0.0.0/16', '10.1.0.0/16']"
  value       = local.vpc_cidr_blocks
}

output "current_subnet_ids" {
  description = "List of all subnet IDs in the VPC. Example: ['subnet-abc123', 'subnet-def456']"
  value       = data.aws_subnets.current.ids
}

output "current_subnet_cidr_blocks" {
  description = "Map of subnet IDs to their CIDR blocks. Example: { 'subnet-abc123' = '10.0.1.0/24' }"
  value       = local.subnet_cidr_blocks
}

output "current_subnet_availability_zones" {
  description = "Map of subnet IDs to their availability zones. Example: { 'subnet-abc123' = 'us-west-2a' }"
  value       = local.subnet_availability_zones
}

output "subnetting_example" {
  description = <<EOT
An example of splitting the VPC's CIDR block into smaller subnets using the 'cidrsubnets' function.
Each element is a CIDR block. Example: ['10.0.0.0/24', '10.0.1.0/24', '10.0.2.0/24', '10.0.3.0/24']
EOT
  value       = local.subnetting_example
}
