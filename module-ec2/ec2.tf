resource "aws_instance" "webserver-ec2" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = var.ssh_key
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnet_id
  depends_on             = [var.igw_id, var.rds_id]
  user_data              = var.rds_var

  tags = {
    Name = var.ec2-name
  }
}

output "wordpress-DNS" {
  value = aws_instance.webserver-ec2.public_dns

}