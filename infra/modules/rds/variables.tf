variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "private_db_subnet_ids" {
  description = "Private database subnet IDs"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "RDS Security Group ID"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "backup_retention_period" {
  description = "Backup retention period"
  type        = number
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}
