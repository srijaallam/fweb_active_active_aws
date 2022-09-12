resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# resource "aws_internet_gateway_attachment" "igw_attachment" {
#   internet_gateway_id = aws_internet_gateway.igw.id
#   vpc_id              = aws_vpc.main.id
# }

