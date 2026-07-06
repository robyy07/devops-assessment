#################################################
# DB Subnet Group
#################################################

resource "aws_db_subnet_group" "this" {

  name = "${var.project_name}-${var.environment}-db-subnet-group"

  subnet_ids = var.private_db_subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-db-subnet-group"
  }

}

#################################################
# PostgreSQL Parameter Group
#################################################

resource "aws_db_parameter_group" "this" {

  name = "${var.project_name}-${var.environment}-postgres"

  family = "postgres16"

  description = "PostgreSQL parameter group"

}

#################################################
# PostgreSQL RDS Instance
#################################################

resource "aws_db_instance" "this" {

  identifier = "${var.project_name}-${var.environment}-postgres"

  engine         = "postgres"
  engine_version = "16.4"

  instance_class = var.instance_class

  allocated_storage = 20
  storage_type      = "gp3"
  storage_encrypted = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  parameter_group_name   = aws_db_parameter_group.this.name
  vpc_security_group_ids = [var.rds_security_group_id]

  publicly_accessible = false

  backup_retention_period = var.backup_retention_period

  deletion_protection = var.deletion_protection

  skip_final_snapshot = true

  multi_az = false

  apply_immediately = true

  tags = {
    Name = "${var.project_name}-${var.environment}-postgres"
  }

}
