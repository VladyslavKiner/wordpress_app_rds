resource "aws_security_group" "webserver-sg" {
  name        = var.sg-name[0]
  description = var.sg-description[0]
  vpc_id      = var.vpc-id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      description = "${ingress.value} from anywhere"
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg-tag[0]
  }
}

resource "aws_security_group" "rds-sg" {
  name        = var.sg-name[1]
  description = var.sg-description[1]
  vpc_id      = var.vpc-id

  ingress {
    description     = "ingress from webserver-sg"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.webserver-sg.id]
  }

  tags = {
    Name = var.sg-tag[1]
  }
}