resource "aws_ecs_cluster" "main" {
  name = "medusa-cluster"
}

resource "aws_iam_role" "ecs_task_execution" {
  name = "ecsTaskExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "exec_policy_attach" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "server" {
  family                   = "medusa-server"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name       = "medusa-server"
      image      = "${var.ecr_repo_uri}:latest"
      portMappings = [{ containerPort = 9000, protocol = "tcp" }]
      essential  = true
      environment = [
        { name = "DATABASE_URL",    value = var.db_connection },
        { name = "REDIS_URL",       value = var.redis_url },
        { name = "JWT_SECRET",      value = var.jwt_secret },
        { name = "COOKIE_SECRET",   value = var.cookie_secret },
      ]
    }
  ])
}

resource "aws_ecs_service" "server_service" {
  name            = "medusa-server-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.server.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = data.aws_subnet_ids.default.ids
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  depends_on = [aws_iam_role_policy_attachment.exec_policy_attach]
}
