resource "aws_lb" "alb" {
  name               = "medusa-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.subnet[*].id
  security_groups    = [aws_security_group.sg.id]
}

resource "aws_lb_target_group" "tg" {
  name     = "medusa-tg"
  port     = 9000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/health"
    protocol            = "HTTP"
    matcher             = "200-399"
    healthy_threshold   = 2
    unhealthy_threshold = 5
    interval            = 30
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group_attachment" "server_attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_ecs_service.server.id
  port             = 9000
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}
