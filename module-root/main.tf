module "vpc-setup" {
  source           = "../module-vpc"
  cidr_block       = var.cidr_block
  vpc-name         = var.vpc-name
  pub-subnet-cidrs = var.pub-subnet-cidrs
  pub-subnet-name  = var.pub-subnet-name
  pvt-subnet-cidrs = var.pvt-subnet-cidrs
  pvt-subnet-name  = var.pvt-subnet-name
  az               = var.az
  igw_name         = var.igw_name
  rt-pub-name      = var.rt-pub-name
}

module "sgs" {
  source         = "../module-sgs"
  vpc-id         = module.vpc-setup.vpc-id
  ingress_ports  = var.ingress_ports
  sg-description = var.sg-description
  sg-name        = var.sg-name
  sg-tag         = var.sg-tag

}

module "ec-2" {
  source        = "../module-ec2"
  ec2-name      = var.ec2-name
  image_id      = var.image_id
  ssh_key       = var.ssh_key
  instance_type = var.instance_type
  sg_id         = module.sgs.sg_id
  subnet_id     = module.vpc-setup.pub_subnet_id
  igw_id        = module.vpc-setup.igw_id
  rds_id        = module.mysql.rds_id
  rds_var       = module.mysql.rds_var
}

module "mysql" {
  source               = "../module-mysql_rds"
  db_instance_type     = var.db_instance_type
  user                 = var.user
  password             = var.password
  subnet_ids           = module.vpc-setup.pvt_subnet_ids
  sg_id                = module.sgs.sg_rds_id
  identifier           = var.identifier
  storage-size         = var.storage-size
  storage_type         = var.storage_type
  db_name              = var.db_name
  engine-version       = var.engine_version
  parameter_group_name = var.parameter_group_name

}

output "wordpress-DNS" {
  value = module.ec-2.wordpress-DNS

}