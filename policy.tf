resource "aws_iam_policy_attachment" "attach_admin_policy" {
  name       = "attach_admin_access"
  users      = [aws_iam_user.t3chy.internal]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

