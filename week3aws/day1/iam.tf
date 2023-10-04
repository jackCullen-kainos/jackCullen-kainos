resource "aws_iam_user" "iam" {
  name = "jc_iam"
  tags = {
    tag-key = "jc-user"
  }
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.iam.name
}

data "aws_iam_policy_document" "iamro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }

}

resource "aws_iam_policy" "policy" {
  name        = "jack-policy"
  description = "My First Policy"
  policy      = data.aws_iam_policy_document.iamro.json
}
resource "aws_iam_group_membership" "team" {
  name = "jc-group-membership"

  users = [
    aws_iam_user.iam.name
  ]
  group = "ReadOnlyEC2"

}