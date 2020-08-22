resource "aws_default_route_table" "tutorial" {
  default_route_table_id = aws_vpc.tutorial.default_route_table_id

  tags = { Name = "Tutorial Public Route Table" }
}

resource "aws_route_table_association" "public_a" {
	subnet_id      = aws_subnet.public_a.id
	route_table_id = aws_vpc.tutorial.default_route_table_id
}

resource "aws_route_table_association" "public_b" {
	subnet_id      = aws_subnet.public_b.id
	route_table_id = aws_vpc.tutorial.default_route_table_id
}

resource "aws_route_table_association" "public_c" {
	subnet_id      = aws_subnet.public_c.id
	route_table_id = aws_vpc.tutorial.default_route_table_id
}

resource "aws_route_table_association" "public_d" {
	subnet_id      = aws_subnet.public_d.id
	route_table_id = aws_vpc.tutorial.default_route_table_id
}

resource "aws_route_table" "tutorial_private" {
  vpc_id = aws_vpc.tutorial.id

  tags = { Name = "Tutorial Route Private Table" }
}

resource "aws_route_table_association" "tutorial_private" {
	subnet_id      = aws_subnet.codebuild_private.id
	route_table_id = aws_route_table.tutorial_private.id
}