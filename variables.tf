variable "application_name" {
  type = string
}

variable "application_port" {
  type = number
}

variable "target_protocol" {
  type = string
}

variable "target_protocol_version" {
  type = string
}

variable "target_deregistration_delay" {
  type = number
}

variable "target_health_check_enable" {
  type = bool
}

variable "target_health_check_path" {
  type = string
}

variable "target_health_check_healthy_threshold" {
  type = number
}

variable "target_health_check_unhealthy_threshold" {
  type = number
}

variable "target_health_check_timeout" {
  type = number
}

variable "target_health_check_interval" {
  type = number
}

variable "target_health_check_success_code" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "alb_listener_load_balancer_arn" {
  type = string
}

variable "alb_listener_port" {
  type = number
}

variable "alb_listener_protocol" {
  type = string
}

variable "alb_listener_certificate_arn" {
  type = string
}

variable "alb_listener_host_rule" {
  type = string
}

variable "bucket_env_name" {
  type = string
}

variable "requires_compatibilities" {
  type = string
}

variable "network_mode" {
  type = string
}

variable "cpu" {
  type = number
}

variable "memory" {
  type = number
}

variable "enable_create_s3_bucket" {
  type = bool
}

variable "runtime_platform_operating_system_family" {
  type = string
}

variable "runtime_platform_cpu_architecture" {
  type = string
}

variable "cloudwatch_log_retention_in_days" {
  type = number
}

variable "container_definitions_image" {
  type = string
}

variable "container_definitions_cpu" {
  type = number
}

variable "container_definitions_memory" {
  type = number
}

variable "container_definitions_memory_reservation" {
  type = number
}

variable "container_definitions_essential" {
  type = bool
}

variable "region" {
  type = string
}

variable "container_definitions_command" {
  type = string
}

variable "path_env_name" {
  type = string
}

variable "file_env_name" {
  type = string
}

variable "enable_versioning_configuration" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "service_desired_count" {
  type = number
}

variable "service_launch_type" {
  type = string
}

variable "service_deployment_minimum_healthy_percent" {
  type = number
}

variable "service_deployment_maximum_percent" {
  type = number
}

variable "subnets_ids" {
  type = list(string)
}

variable "service_assign_public_ip" {
  type = bool
}