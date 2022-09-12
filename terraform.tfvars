region                  = "us-east-1"
availability_zone_1     = "us-east-1a"
availability_zone_2     = "us-east-1b"


vpc_cidr                = "10.0.0.0/16"
public1_subnet          = "10.0.1.0/24"
public2_subnet          = "10.0.10.0/24"
private1_subnet         = "10.0.2.0/24"
private2_subnet         = "10.0.20.0/24"

public1_ip_address      = "10.0.1.11"
public1_description     = "public1-az1"

public2_ip_address      = "10.0.10.11"
public2_description     = "public2-az2"

private1_ip_address     = "10.0.2.11"
private2_ip_address     = "10.0.20.11"
private1_description    = "private1-az1"
private2_description    = "private2-az2"

lb_name                 = "fweb_nlb"

target_groupname        = "fweb_target_group"

instance_type           = "c5.large"

fortiweb_os_version     = "6.3.17"
keypair                 = ""

customer_prefix         = ""

environment             = "test"

instance_name           = "fweb"

fwb_byol_license_1      = "files/license1.lic"
fwb_byol_license_2      = "files/license2.lic"
fwb_system_config_1     = "files/fweb1_config.txt"

fwb_system_config_2     = "files/fweb2_config.txt"
fwb_admin_password      = ""