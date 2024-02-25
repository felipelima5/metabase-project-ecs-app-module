resource "aws_ecs_service" "this" {
  name            = "${var.application_name}-svc-application"
  cluster         = var.ecs_cluster_name
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.service_desired_count

  launch_type = var.service_launch_type

  deployment_minimum_healthy_percent = var.service_deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.service_deployment_maximum_percent

  network_configuration {
    security_groups  = [aws_security_group.this.id]
    subnets          = var.subnets_ids
    assign_public_ip = var.service_assign_public_ip
  }

  tags = var.tags

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = var.application_name           #Nome do Container dentro da taskdefinition
    container_port   = var.application_port #porta do container em container definitions na task
  }

  depends_on = [aws_lb_listener.forward]
}


resource "aws_security_group" "this" {
  name        = "${var.application_name}-svc-application"
  description = "Allow Traffic Communication ${var.application_name}-svc-application"
  vpc_id      = var.vpc_id

   ingress {
    description      = "Allow Traffic From ALB"
    from_port        = var.application_port
    to_port          = var.application_port
    protocol         = "tcp"
    security_groups  = var.security_group_alb
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}