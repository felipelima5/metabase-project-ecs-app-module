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