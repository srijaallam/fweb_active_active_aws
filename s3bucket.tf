resource "aws_s3_bucket" "fweb" {
    bucket = "s3-fweb-lab"
    acl    = "private" 

    tags = {
        Name        = "s3-fweb-lab"

    }


}

resource "aws_s3_bucket_object" "fweb1-license" {
    bucket = aws_s3_bucket.fweb.id
    key    = var.fwb_byol_license_1
    acl    = "private" 
    source = var.fwb_byol_license_1
    etag   = filemd5(var.fwb_byol_license_1)

    depends_on = [aws_s3_bucket.fweb]
    

}

resource "aws_s3_bucket_object" "fweb2-license" {
    bucket = aws_s3_bucket.fweb.id
    key    = var.fwb_byol_license_2
    acl    = "private" 
    source = var.fwb_byol_license_2
    etag   = filemd5(var.fwb_byol_license_2)

    depends_on = [aws_s3_bucket.fweb]
}


data "template_file" "fweb1_cli" {
  template = file("./config_templates/fwb-userdata-byol.tpl")

  vars = {
      fwb_vm_name             = "FWB1"
      fwb_private_ip          = var.private1_ip_address
      fwb_ha_peer_ip          = var.private2_ip_address
      fwb_ha_priority         = 1
    }
}


data "template_file" "fweb2_cli" {
  template = file("./config_templates/fwb-userdata-byol.tpl")

  vars = {
      fwb_vm_name             = "FWB2"
      fwb_private_ip          = var.private2_ip_address
      fwb_ha_peer_ip          = var.private1_ip_address
      fwb_ha_priority         = 2
    
    }


  }


#upload the file cli to s3 
resource "aws_s3_bucket_object" "fweb1-cli" {
    bucket  = aws_s3_bucket.fweb.id
    key     = var.fwb_system_config_1
    acl     = "private" 
    content = data.template_file.fweb1_cli.rendered
    etag    = md5(data.template_file.fweb1_cli.rendered)

    
      
}
resource "aws_s3_bucket_object" "fweb2-cli" {
    bucket  = aws_s3_bucket.fweb.id
    key     = var.fwb_system_config_2
    acl     = "private" 
    content = data.template_file.fweb2_cli.rendered
    etag    = md5(data.template_file.fweb2_cli.rendered)

    
}