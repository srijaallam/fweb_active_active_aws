resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   depends_on = [aws_internet_gateway.igw]
}

resource "aws_route" "gateway" {
    route_table_id = aws_route_table.route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

resource "aws_main_route_table_association" "main_rt" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.route_table.id
}

# resource "aws_route_table" "private1_route_table" {
#   vpc_id = aws_vpc.main.id
# }

# resource "aws_route_table" "private2_route_table" {
#   vpc_id = aws_vpc.main.id
# }

# resource "aws_route_table_association" "private1_route_table_association" {
#   subnet_id      = aws_subnet.private1_subnet.id
#   route_table_id = aws_route_table.private1_route_table.id
# }

# resource "aws_route_table_association" "private2_route_table_association" {
#   subnet_id      = aws_subnet.private2_subnet.id
#   route_table_id = aws_route_table.private2_route_table.id
# }