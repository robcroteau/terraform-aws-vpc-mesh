output "west_vpc_id" {
  value = module.west-admin-vpc.vpc_id
}

output "west_vpc_cidr_block" {
  value = module.west-admin-vpc.vpc_cidr_block
}


output "west_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.west-admin-vpc.private_subnets
}

output "west_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.west-admin-vpc.private_subnets_cidr_blocks
}

output "west_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.west-admin-vpc.public_subnets
}

output "west_public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.west-admin-vpc.public_subnets_cidr_blocks
}