resource "aws_iam_policy_attachment" "AmazonSSMManagedInstanceCore" {
    name       = "AmazonSSMManagedInstanceCore"
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    roles      = [ "AmazonSSMRoleForInstancesQuickSetup", "${aws_iam_role.ci.name}" ]
}
