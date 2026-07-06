output "db_instance_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.this.endpoint
}

output "db_instance_identifier" {
  description = "RDS identifier"
  value       = aws_db_instance.this.identifier
}
