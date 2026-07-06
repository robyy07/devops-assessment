#################################################
# ECS Service
#################################################

resource "aws_ecs_service" "this" {

  name = "${var.project_name}-${var.environment}-service"

  cluster = aws_ecs_cluster.this.id

  task_definition = aws_ecs_task_definition.this.arn

  desired_count = 1

  launch_type = "FARGATE"

  network_configuration {

    subnets = var.private_app_subnet_ids

    security_groups = [
      var.ecs_security_group_id
    ]

    assign_public_ip = false

  }

  load_balancer {

    target_group_arn = aws_lb_target_group.this.arn

    container_name = "nginx"

    container_port = var.container_port

  }

  depends_on = [
    aws_lb_listener.http
  ]

}
