resource "aws_instance" "jenkins_master" {
  ami                         = "ami-0bd7691bf6470fe9c"
  ebs_optimized               = false
  instance_type               = "t3.medium"
  monitoring                  = false
  key_name                    = ""
  subnet_id                   = aws_subnet.public_a.id
  vpc_security_group_ids      = [ aws_security_group.ci_master.id ]
  iam_instance_profile        = aws_iam_instance_profile.ci.name
  associate_public_ip_address = true
  source_dest_check           = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 100
    delete_on_termination = true
  }

  tags = { 
    Name = "Tutorial Jenkins Master"
  }
}
