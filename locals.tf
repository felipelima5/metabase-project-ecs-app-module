locals {
  task_def = <<TASK_DEFINITION
[
  {
    "name": "${var.application_name}",
    "image": "${var.container_definitions_image}",
    "cpu": ${var.container_definitions_cpu},
    "memory": ${var.container_definitions_memory},
    "memoryReservation": ${var.container_definitions_memory_reservation}, 
    "essential": ${var.container_definitions_essential},
    "environmentFiles": [],
    "logConfiguration": {
        "logDriver": "awslogs",
        "secretOptions": null,
        "options": {
          "awslogs-group": "/ecs/${var.application_name}-svc-application",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "ecs"
        }
      },
    "portMappings": [
      {
        "containerPort": ${var.application_port}
      }
    ],
    "command": ["${var.container_definitions_command}"]
  }
]
TASK_DEFINITION