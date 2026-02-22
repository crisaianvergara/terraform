resource "aws_instance" "main_instance" {
  ami                         = "ami-0c687e8f5c4e54af5"
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.main_sg.id]

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  tags = merge(local.common_tags, {
    Name = "06-resources-main-instance"
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "main_sg" {
  description = "Security group allowing traffic on ports 443 and 80"
  name        = "main-sg"
  vpc_id      = aws_vpc.main_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "http_sgir" {
  security_group_id = aws_security_group.main_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80

  tags = merge(local.common_tags, {
    Name = "06-resources-http-sgir"
  })
}

resource "aws_vpc_security_group_ingress_rule" "https_sgir" {
  security_group_id = aws_security_group.main_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443

  tags = merge(local.common_tags, {
    Name = "06-resources-https-sgir"
  })
}