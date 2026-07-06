module "network" {

  source = "../../modules/network"

  project_name = "devops-assessment"

  environment = var.environment

  vpc_cidr = "10.1.0.0/16"

  public_subnet_cidrs = [
    "10.1.1.0/24",
    "10.1.2.0/24"
  ]

  private_app_subnet_cidrs = [
    "10.1.11.0/24",
    "10.1.12.0/24"
  ]

  private_db_subnet_cidrs = [
    "10.1.21.0/24",
    "10.1.22.0/24"
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

  instance_class = "db.t3.small"

  backup_retention_period = 30

  deletion_protection = true

}

module "ecs" {

  source = "../../modules/ecs"

  project_name = "devops-assessment"

  environment = var.environment

  vpc_id = module.network.vpc_id

  public_subnet_ids = module.network.public_subnet_ids

  private_app_subnet_ids = module.network.private_app_subnet_ids

  alb_security_group_id = module.security.alb_security_group_id

  ecs_security_group_id = module.security.ecs_security_group_id

  container_image = "nginx:latest"

  container_port = 80

}
