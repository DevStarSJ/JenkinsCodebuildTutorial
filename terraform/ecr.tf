resource "aws_ecr_repository" "jenkins_tutorial" {
  name = "jenkins_tutorial"
}

resource "aws_ecr_lifecycle_policy" "jenkins_tutorial" {
  repository = aws_ecr_repository.jenkins_tutorial.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images more than 20 counts.",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 10
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
