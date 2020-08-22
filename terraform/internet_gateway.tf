resource "aws_internet_gateway" "tutorial" {
  vpc_id = aws_vpc.tutorial.id

  tags = { Name = "Tutorial Internet Gateway" }
}

resource "aws_route" "tutorial" {
	route_table_id         = aws_vpc.tutorial.default_route_table_id
	destination_cidr_block = "0.0.0.0/0"
	gateway_id             = aws_internet_gateway.tutorial.id
}
