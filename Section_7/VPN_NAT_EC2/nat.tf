# Custom NAT Gateway

resource "aws_eip" "level_up_nat" {
  domain = "vpc"

}

resource "aws_nat_gateway" "level_up_nat_gw" {
  allocation_id = aws_eip.level_up_nat.id
  subnet_id = aws_subnet.level_up_vpc_public_1.id
  depends_on = [ aws_internet_gateway.lavel_up_vpc_GW ]
}

resource "aws_route_table" "level_up_private" {
  vpc_id = aws_vpc.level_up_vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.level_up_nat_gw.id
  }

  tags = {
    Name = "levelup_private"
  }
}

resource "aws_route_table_association" "level_up_private_1_a" {
  subnet_id = aws_subnet.lavel_up_private_subnet1.id
  route_table_id = aws_route_table.level_up_private.id
}

resource "aws_route_table_association" "level_up_private_1_b" {
  subnet_id = aws_subnet.lavel_up_private_subnet2.id
  route_table_id = aws_route_table.level_up_private.id
}

resource "aws_route_table_association" "level_up_private_1_c" {
  subnet_id = aws_subnet.lavel_up_private_subnet3.id
  route_table_id = aws_route_table.level_up_private.id
}