resource "aws_eip" "tutorial" {
  vpc = true
}

resource "aws_nat_gateway" "public_a" {
  allocation_id = aws_eip.tutorial.id
  subnet_id     = aws_subnet.public_a.id
}

resource "aws_route" "tutorial_private" {
	route_table_id         = aws_route_table.tutorial_private.id
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id         = aws_nat_gateway.public_a.id
}
