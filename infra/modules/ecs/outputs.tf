output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value = aws_lb.this.dns_name
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value = aws_ecs_cluster.this.name
}
