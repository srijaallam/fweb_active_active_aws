data "aws_ami" "fortiweb_byol" {
  most_recent = true

  filter {
    name                         = "name"
    values                       = ["FortiWeb-AWS-${var.fortiweb_os_version}_BYOL_Release-*"]
  }

  filter {
    name                         = "virtualization-type"
    values                       = ["hvm"]
  }

  owners                         = ["679593333241"] # Canonical
}

# resource "aws_network_interface" "fweb1_eth0" {
#   subnet_id   = aws_subnet.public1_subnet.id
#   description = "fweb1-port1"
# }

resource "aws_network_interface" "fweb1_eth1" {
  subnet_id   = aws_subnet.private1_subnet.id
  private_ips = [var.private1_ip_address]
   attachment  {
      instance = aws_instance.fortiweb_1.id
      device_index = 1
  }
}


resource "aws_instance" "fortiweb_1" {
  ami                         = data.aws_ami.fortiweb_byol.id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone_1
  subnet_id                   = aws_subnet.public1_subnet.id
  key_name                    = var.keypair
  associate_public_ip_address = true
  iam_instance_profile        =  aws_iam_instance_profile.fweb_s3_profile.name
  security_groups             = [aws_security_group.fwebsg.id]
  user_data                   = <<-EOF
    fwb_json_start {
        "cloud-initd": "enable",
        "bucket": "${aws_s3_bucket.fweb.id}",
        "region": "${var.region}",
        "license": "/${aws_s3_bucket_object.fweb1-license.key}",
        "config": "/${aws_s3_bucket_object.fweb1-cli.key}"
    }
    EOF
    tags = {
      Name            = "${var.customer_prefix}-${var.environment}-${var.instance_name}"
    }
      depends_on = [aws_s3_bucket_object.fweb1-cli]
}

resource "aws_network_interface" "fweb2_eth1" {
  subnet_id   = aws_subnet.private2_subnet.id
  private_ips = [var.private2_ip_address]
  attachment  {
      instance = aws_instance.fortiweb_2.id
      device_index = 1
  }
}


resource "aws_instance" "fortiweb_2" {
  ami                         = data.aws_ami.fortiweb_byol.id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone_2
  subnet_id                   = aws_subnet.public2_subnet.id
  key_name                    = var.keypair
  iam_instance_profile        = aws_iam_instance_profile.fweb_s3_profile.name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.fwebsg.id]
  user_data                   = <<-EOF
    fwb_json_start {
        "cloud-initd": "enable",
        "bucket": "${aws_s3_bucket.fweb.id}",
        "region": "${var.region}",
        "license": "/${aws_s3_bucket_object.fweb2-license.key}",
        "config": "/${aws_s3_bucket_object.fweb2-cli.key}"
    }
    EOF
    tags = {
      Name            = "${var.customer_prefix}-${var.environment}-${var.instance_name}"
    }
  depends_on = [aws_s3_bucket_object.fweb2-cli]
}

