resource "aws_db_instance" "mysql" {
  identifier             = var.identifier
  allocated_storage      = var.storage-size
  storage_type           = var.storage_type
  db_subnet_group_name   = aws_db_subnet_group.pvt_group.name
  db_name                = var.db_name
  engine                 = "mysql"
  engine_version         = var.engine-version
  instance_class         = var.db_instance_type
  username               = var.user
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.sg_id]
}

data "template_file" "RDS" {
  template = file("../module-ec2/user-data.sh")
  vars = {
    rds = aws_db_instance.mysql.endpoint
  }
  depends_on = [aws_db_instance.mysql]

}

resource "aws_db_subnet_group" "pvt_group" {
  name       = "pvt_group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}