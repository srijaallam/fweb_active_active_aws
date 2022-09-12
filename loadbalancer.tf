resource "aws_lb" "public_nlb" {
  name                                  = "test-lb-tf"
  internal                              = false
  enable_cross_zone_load_balancing      = true
  load_balancer_type                    = "network"
  subnets                               = [aws_subnet.public1_subnet.id, aws_subnet.public2_subnet.id]

  enable_deletion_protection            = false

}
resource "aws_lb_target_group" "fweb_target" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn =  aws_lb.public_nlb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.fweb_target.arn
  }
}

resource "aws_lb_target_group_attachment" "fweb1_instance" { 
  target_group_arn = aws_lb_target_group.fweb_target.arn
  target_id        = aws_instance.fortiweb_1.id
  port             = 80
}


resource "aws_lb_target_group_attachment" "fweb2_instance" { 
  target_group_arn = aws_lb_target_group.fweb_target.arn
  target_id        = aws_instance.fortiweb_2.id
  port             = 80
}