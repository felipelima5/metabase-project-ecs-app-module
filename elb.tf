resource "aws_lb_target_group" "this" {
  name                 = "${var.application_name}-svc-app"
  port                 = var.application_port
  protocol             = var.target_protocol
  protocol_version     = var.target_protocol_version
  target_type          = "ip"
  deregistration_delay = var.target_deregistration_delay
  health_check {
    enabled             = var.target_health_check_enable
    path                = var.target_health_check_path
    healthy_threshold   = var.target_health_check_healthy_threshold
    unhealthy_threshold = var.target_health_check_unhealthy_threshold
    timeout             = var.target_health_check_timeout
    interval            = var.target_health_check_interval
    matcher             = var.target_health_check_success_code #Success Code
  }
  vpc_id = var.vpc_id

  tags = var.tags
}

resource "aws_lb_listener" "forward" {
  load_balancer_arn = var.alb_listener_load_balancer_arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol
  certificate_arn   = var.alb_listener_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "503"
    }
  }
}

resource "aws_lb_listener_rule" "this" {
  listener_arn = aws_lb_listener.forward.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  condition {
    host_header {
      values = ["${var.alb_listener_host_rule}"]
    }
  }
}