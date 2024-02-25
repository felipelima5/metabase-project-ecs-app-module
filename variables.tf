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