/*******************
  West Admin VPC Vars
*******************/

variable "west_admin_cidr" {
    description = "CIDR Block for the VPC"
    default = "10.0.0.0/16"
}
variable "west_admin_name" {
    description = "name of the VPC"
    default = "us-west-1-admin-vpc"
  
}
variable "west_admin_public_subnets" {
    description = "List of subnets"
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}


/********************
  Central Admin VPC Vars
*********************/
variable "eucentral_admin_cidr" {
    description = "CIDR Block for the VPC"
    default = "10.1.0.0/16"
}
variable "eucentral_admin_name" {
    description = "name of the VPC"
    default = "eu-central-1-admin-vpc"
  
}

variable "eucentral_admin_public_subnets" {
    description = "List of subnets"
    default = ["10.1.1.0/24", "10.1.2.0/24"]
  
}

/*******************
  West app VPC Vars
*******************/

variable "west_app_cidr" {
    description = "CIDR Block for the VPC"
    default = "10.2.0.0/16"
}
variable "west_app_name" {
    description = "name of the VPC"
    default = "us-west-1-app-vpc"
  
}
variable "west_app_private_subnets" {
    description = "List of subnets"
    default = ["10.2.1.0/24", "10.2.2.0/24"]
}

variable "west_db_private_subnets" {
    description = "List of subnets"
    default = ["10.2.3.0/24", "10.2.4.0/24"]
}

/*******************
 Central app VPC Vars
*******************/

variable "eucentral_app_cidr" {
    description = "CIDR Block for the VPC"
    default = "10.3.0.0/16"
}
variable "eucentral_app_name" {
    description = "name of the VPC"
    default = "us-central-1-app-vpc"
  
}
variable "eucentral_app_private_subnets" {
    description = "List of subnets"
    default = ["10.3.1.0/24", "10.3.2.0/24"]
}

variable "eucentral_db_private_subnets" {
    description = "List of subnets"
    default = ["10.3.3.0/24", "10.3.4.0/24"]
}