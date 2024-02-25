resource "aws_ecs_task_definition" "this" {
  family                   = "${var.application_name}-svc-application"
  execution_role_arn       = aws_iam_role.execution_role.arn
  task_role_arn            = aws_iam_role.execution_role.arn
  requires_compatibilities = [var.requires_compatibilities]
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  container_definitions    = var.enable_create_s3_bucket == true ? local.task_def_s3_env_file : local.task_def

  runtime_platform {
    operating_system_family = var.runtime_platform_operating_system_family
    cpu_architecture        = var.runtime_platform_cpu_architecture
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/ecs/${var.application_name}-svc-application"
  retention_in_days = var.cloudwatch_log_retention_in_days

  tags = var.tags
}