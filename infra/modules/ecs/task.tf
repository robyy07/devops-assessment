#################################################
# ECS Task Definition
#################################################

resource "aws_ecs_task_definition" "this" {

  family = "${var.project_name}-${var.environment}"

  network_mode = "awsvpc"

  requires_compatibilities = ["FARGATE"]

  cpu = "256"

  memory = "512"

  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  task_role_arn = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name  = "nginx"
      image = var.container_image

      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs.name
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }

    }
  ])

}
