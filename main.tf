provider "aws" {
  alias  = "us-west-1"
  region = "us-west-1"
}

provider "aws" {
  alias  = "eu-central-1"
  region = "eu-central-1"
}

/**********************
  VPC Configuration
**********************/

data "aws_availability_zones" "west-azs" {
  provider = aws.us-west-1
  state = "available"
}

data "aws_availability_zones" "central-azs" {
  provider = aws.eu-central-1
  state = "available"
}
module "west-admin-vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.west_admin_name
    cidr = var.west_admin_cidr
    azs = [data.aws_availability_zones.west-azs.names[0], data.aws_availability_zones.west-azs.names[1]]
    public_subnets = var.west_admin_public_subnets
    enable_nat_gateway = true

    providers ={
        aws = aws.us-west-1
    }
}

module "central-admin-vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.eucentral_admin_name
    cidr = var.eucentral_admin_cidr
    azs = [data.aws_availability_zones.central-azs.names[0], data.aws_availability_zones.central-azs.names[1]]
    public_subnets = var.eucentral_admin_public_subnets
    enable_nat_gateway = true

    providers ={
        aws = aws.eu-central-1
    }
}

/*******************
  Application VPCs
********************/
module "west-app-vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.west_app_name
    cidr = var.west_app_cidr
    azs = [data.aws_availability_zones.west-azs.names[0], data.aws_availability_zones.west-azs.names[1]]
    public_subnets = var.west_app_private_subnets
    database_subnets = var.west_db_private_subnets
    enable_nat_gateway = true

    providers ={
        aws = aws.us-west-1
    }
}

module "central-app-vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.eucentral_app_name
    cidr = var.eucentral_app_cidr
    azs = [data.aws_availability_zones.central-azs.names[0], data.aws_availability_zones.central-azs.names[1]]
    public_subnets = var.eucentral_app_private_subnets
    database_subnets = var.eucentral_db_private_subnets
    enable_nat_gateway = true

    providers ={
        aws = aws.eu-central-1
    }
}

/************************
 Bastion Hosts
************************/
# resource "aws_instance" "bastion" {
#     ami =
#     instance_type =
#     subnet_id =
#     device_name 
# }  