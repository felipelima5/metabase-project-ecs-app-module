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