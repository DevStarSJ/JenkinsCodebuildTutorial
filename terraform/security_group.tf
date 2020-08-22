resource "aws_security_group" "ci_master" {
  name        = "totorial_ci_master"
  description = "Tutorial CI Master"
  vpc_id      = aws_vpc.tutorial.id

  ingress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = { 
    Name = "Tutorial CI Master"
  }
}

resource "aws_security_group" "ci_agent" {
    name        = "tutorial_ci_agent"
    description = "Tutorial CI Agent"
    vpc_id      = aws_vpc.tutorial.id

    ingress {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = { Name = "Tutorial CI Agent" }
}
