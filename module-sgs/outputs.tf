output "sg_id" {
  value = aws_security_group.webserver-sg.id

}

output "sg_rds_id" {
  value = aws_security_group.rds-sg.id

}