variable "buildspec_tutorial" {
    type = string
    default = <<EOF
version: 0.2

phases:
  #install:
    #commands:
      # - command
      # - command
  #pre_build:
    #commands:
      # - command
      # - command
  build:
    commands:
      - echo "hello world"
      # - command
  #post_build:
    #commands:
      # - command
      # - command
#artifacts:
  #files:
    # - location
    # - location
  #name: $(date +%Y-%m-%d)
  #discard-paths: yes
  #base-directory: location
#cache:
  #paths:
    # - paths
EOF
}

resource "aws_codebuild_project" "tutorial" {
  name          = "tutorial"
  build_timeout = "20"
  service_role  = aws_iam_role.codebuild.arn

  source {
    type            = "S3"
    location        = "jenkins-tutorial-dev/tutorial"
    buildspec = var.buildspec_tutorial
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:4.0"
    type         = "LINUX_CONTAINER"
    privileged_mode = true
  }

  vpc_config {
    vpc_id = aws_vpc.tutorial.id
    subnets = [ aws_subnet.codebuild_private.id ]
    security_group_ids = [ aws_security_group.ci_agent.id ]
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
}
