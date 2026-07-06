variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "private_app_subnet_ids" {
  description = "Private application subnet IDs"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ALB Security Group ID"
  type        = string
}

variable "ecs_security_group_id" {
  description = "ECS Security Group ID"
  type        = string
}

variable "container_image" {
  description = "Container image"
  type        = string
}

variable "container_port" {
  description = "Application container port"
  type        = number
}
