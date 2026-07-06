module "network" {
  source = "../../modules/network"

  project_name = "devops-assessment"
  environment  = var.environment
  vpc_cidr     = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_app_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  private_db_subnet_cidrs = [
    "10.0.21.0/24",
    "10.0.22.0/24"
  ]

}

module "security" {

  source = "../../modules/security"

  project_name = "devops-assessment"

  environment = var.environment

  vpc_id = module.network.vpc_id

}

module "rds" {

  source = "../../modules/rds"

  project_name = "devops-assessment"

  environment = var.environment

  private_db_subnet_ids = module.network.private_db_subnet_ids

  rds_security_group_id = module.security.rds_security_group_id

  db_name = "hoteldb"

  db_username = "postgres"

  db_password = "Password@123"

  instance_class = "db.t3.micro"

  backup_retention_period = 3

  deletion_protection = false

}
