resource "random_string" "random" {
  length           = 5
  special          = false
}

resource "aws_security_group" "fwebsg" {
  name = "${var.customer_prefix}-${var.environment}-${random_string.random.result}"
  description = "Allow required ports to the ec2 instance"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
	Name = "${var.customer_prefix}-${var.environment}-SG"
    Environment = var.environment
  }
}
