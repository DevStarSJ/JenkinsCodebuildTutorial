resource "aws_iam_policy_attachment" "AmazonSSMManagedInstanceCore" {
    name       = "AmazonSSMManagedInstanceCore"
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    roles      = [ "AmazonSSMRoleForInstancesQuickSetup", "${aws_iam_role.ci.name}" ]
}

resource "aws_iam_policy_attachment" "AmazonEC2ContainerRegistryFullAccess" {
    name       = "AmazonEC2ContainerRegistryFullAccess"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
    roles      = [ "${aws_iam_role.codebuild.name}" ]
}

resource "aws_iam_policy_attachment" "CloudWatchLogsFullAccess" {
    name       = "CloudWatchLogsFullAccess"
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
    roles      = ["${aws_iam_role.codebuild.name}"]
}

resource "aws_iam_policy_attachment" "AmazonS3FullAccess" {
    name       = "AmazonS3FullAccess"
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    roles      = [ "${aws_iam_role.codebuild.name}", "${aws_iam_role.ci.name}" ]
}

resource "aws_iam_policy_attachment" "AmazonVPCFullAccess" {
    name       = "AmazonVPCFullAccess"
    policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
    roles      = ["${aws_iam_role.codebuild.name}"]
}
