resource "aws_iam_instance_profile" "ci" {
  name = "tutorial_ci"
  role = aws_iam_role.ci.name
}
