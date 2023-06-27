output "rds_var" {
  value = data.template_file.RDS.rendered

}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint

}

output "rds_id" {
  value = aws_db_instance.mysql.id

}