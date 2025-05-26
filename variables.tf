variable "cidr_block" {
  description = "Base CIDR block for network calculations. Example: '10.0.0.0/16'"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_count" {
  description = "Number of subnets to create from the base CIDR block"
  type        = number
  default     = 4
}

variable "subnet_bit_mask" {
  description = "Subnet bit mask for individual subnets (e.g., /24, /28). Specified as a number (24, 28)"
  type        = number
  default     = 24
}
