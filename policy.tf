resource "aws_iam_policy" "read_only_s3" {
  name        = "ReadOnlyS3Policy"
  path        = "/"
  description = "Grants read-only access to S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "attach_s3_readonly" {
  name       = "attach_readonly_policy"
  users      = [aws_iam_user.t3chy.name]
  policy_arn = aws_iam_policy.read_only_s3.arn
}
