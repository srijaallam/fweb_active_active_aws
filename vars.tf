variable "region" {
  description = "The AWS region to use"  
} 

variable "availability_zone_1" {
  description = "The availability zone"  
} 

variable "availability_zone_2" {
  description = "The availability zone"  
} 

variable "vpc_cidr" {
    description = "VPC CIDR block"
}

variable "public1_subnet" {
    description = "public1_subnet"
}

variable "public2_subnet" {
    description = "public1_subnet"
}

variable "private1_subnet" {
    description = "public1_subnet"
}

variable "private2_subnet" {
    description = "public1_subnet"
}

variable "lb_name"{
   description = "NLB name"
}               

variable "target_groupname" {
    description = "target_group_name"
}   


variable "instance_type"{
    description = "instance_type"
} 


variable "fortiweb_os_version" {
    description = "fortiweb_os_version"
}

variable "keypair" {
    description = "keypair"
}

variable "public1_ip_address"{
    description = "public ip address"
}

variable "public2_ip_address"{
    description = "public ip address"
}

variable "private1_ip_address"{
    description = "private ip address"
}

variable "private2_ip_address"{
    description = "private ip address"
}

variable "customer_prefix"{
    description = "customer_prefix"
} 

variable "environment" {
    description = "environment"
}           

variable "instance_name" {
    description = "name of Fortiweb instance"
}

variable "fwb_system_config_2"{
    description = "config for fweb1"
}

variable "fwb_system_config_1"{
    description = "config for fweb2"
}

variable "fwb_byol_license_1" {
    description = "byol license"

}

variable "fwb_byol_license_2" {
    description = "byol license"

}

variable "fwb_admin_password"{
    description = "password"
}