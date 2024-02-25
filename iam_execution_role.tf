#Role ExecutionRole
resource "aws_iam_role" "execution_role" {
  name               = "${var.application_name}-svc-application-${random_password.ecs_task_role_name_sufixo.result}"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_policy.json
}

# Trust Relationship
data "aws_iam_policy_document" "ecs_task_assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

#Anexando Policy
resource "aws_iam_role_policy" "ecs_get_policy" {
  name   = "Policy-TaskDefinition-${random_password.ecs_task_role_name_sufixo.result}"
  role   = aws_iam_role.execution_role.id
  policy = data.aws_iam_policy_document.ecs_task_policy.json
}

#Policy
data "aws_iam_policy_document" "ecs_task_policy" {

  statement {
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "s3:GetBucketLocation",
      "kms:Decrypt",
      "secretsmanager:GetSecretValue",
      "ssm:*"
    ]

    effect = "Allow"
    resources = [
      "*"
    ]

    sid = "PermissionsTaskECS"
  }

  statement {
    actions = [
      "s3:*"
    ]

    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_env_name}/*"
    ]

    sid = "s3GetObject"
  }
}


resource "random_password" "ecs_task_role_name_sufixo" {
  length      = 10
  special     = false
  upper       = false
  lower       = false
  number      = true
  numeric     = true
  min_numeric = 10
}

