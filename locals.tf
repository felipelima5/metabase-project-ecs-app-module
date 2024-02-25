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



  task_def_s3_env_file = <<TASK_DEFINITION
[
  {
    "name": "${var.application_name}",
    "image": "${var.container_definitions_image}",
    "cpu": ${var.container_definitions_cpu},
    "memory": ${var.container_definitions_memory},
    "memoryReservation": ${var.container_definitions_memory_reservation}, 
    "essential": ${var.container_definitions_essential},
    "environmentFiles": [{"value": "arn:aws:s3:::${var.bucket_env_name}/${var.path_env_name}/${var.file_env_name}.env", "type": "s3"}],
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
}

