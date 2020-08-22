resource "aws_subnet" "public_a" {
	vpc_id            = aws_vpc.tutorial.id
	cidr_block        = "172.32.0.0/20"
	availability_zone = "ap-northeast-2a"

	tags = {
    Name = "Tutorial Subnet A"
  }
}

resource "aws_subnet" "public_b" {
	vpc_id            = aws_vpc.tutorial.id
	cidr_block        = "172.32.16.0/20"
	availability_zone = "ap-northeast-2b"

	tags = { 
    Name = "Tutorial Subnet B"
  }
}

resource "aws_subnet" "public_c" {
	vpc_id            = aws_vpc.tutorial.id
	cidr_block        = "172.32.32.0/20"
	availability_zone = "ap-northeast-2c"

	tags = { 
    Name = "Tutorial Subnet C"
  }
}

resource "aws_subnet" "public_d" {
	vpc_id            = aws_vpc.tutorial.id
	cidr_block        = "172.32.48.0/20"
	availability_zone = "ap-northeast-2d"

	tags = { 
    Name = "Tutorial Subnet D" 
  }
}

resource "aws_subnet" "codebuild_private" {
	vpc_id                  = aws_vpc.tutorial.id
	cidr_block              = "172.32.64.0/20"
	availability_zone       = "ap-northeast-2a"

	tags = { Name = "Tutorial Private" }
}
