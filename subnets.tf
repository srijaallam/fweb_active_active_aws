resource "aws_subnet" "public1_subnet" {
  vpc_id                     = aws_vpc.main.id
  cidr_block                 = "10.0.1.0/24"
  availability_zone          = var.availability_zone_1
}

resource "aws_subnet" "public2_subnet" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.0.10.0/24"
  availability_zone         = var.availability_zone_2
}

resource "aws_subnet" "private1_subnet" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.0.2.0/24"
  availability_zone         = var.availability_zone_1
}

resource "aws_subnet" "private2_subnet" {
  vpc_id                     = aws_vpc.main.id
  cidr_block                 = "10.0.20.0/24"
  availability_zone          = var.availability_zone_2
}

