# 1. نیا IAM یوزر بنانا
resource "aws_iam_user" "deployer" {
  name = var.iam_user_name
}

# 2. یوزر کے لیے Access Keys بنانا
resource "aws_iam_access_key" "deployer_keys" {
  user = aws_iam_user.deployer.name
}

# 3. یوزر کے لیے مخصوص پالیسی بنانا (صرف S3 کے لیے)
resource "aws_iam_user_policy" "s3_policy" {
  name = "S3DeployPolicy"
  user = aws_iam_user.deployer.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:PutObject", "s3:GetObject", "s3:ListBucket", "s3:DeleteObject"]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}