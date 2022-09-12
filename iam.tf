resource "aws_iam_role" "fweb_s3" {
  name = "fweb_ec2_s3"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "fweb_s3_profile" {
  name = "fweb_s3_profile"
  role = aws_iam_role.fweb_s3.name
}

resource "aws_iam_role_policy" "fweb_s3_policy" {
  name = "fweb_s3_policy"
  role = aws_iam_role.fweb_s3.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.fweb.id}"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.fweb.id}/*"]
    }
  ]
}
EOF
}
