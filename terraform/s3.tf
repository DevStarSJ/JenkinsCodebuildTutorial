resource "aws_s3_bucket" "jenkins_tutorial" {
  bucket = "jenkins-tutorial-dev"
  acl    = "private"
  versioning {
    enabled = true
  }
}
