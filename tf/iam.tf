resource "aws_iam_user" "monkeys" {
  name = "monkeys"
}

resource "aws_iam_access_key" "monkeys" {
  user = aws_iam_user.monkeys.name
}

resource "aws_iam_user_policy" "monkeys" {
  name = "monkeys"
  user = aws_iam_user.monkeys.name
  policy = <<EOF
{
  "Version": "2012-10-17",
"Statement": [
    {
      "Sid": "Stmt1357739573947",
      "Action": [
        "ec2:CreateTags",
        "ec2:DeleteSnapshot",
        "ec2:DescribeImages",
        "ec2:DescribeInstances",
        "ec2:DescribeSnapshots",
        "ec2:DescribeVolumes",
        "ec2:TerminateInstances",
        "ses:SendEmail",
        "elasticloadbalancing:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1357739649609",
      "Action": [
        "autoscaling:DeleteAutoScalingGroup",
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeAutoScalingInstances",
        "autoscaling:DescribeLaunchConfigurations"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1357739730279",
      "Action": [
        "sdb:BatchDeleteAttributes",
        "sdb:BatchPutAttributes",
        "sdb:DomainMetadata",
        "sdb:GetAttributes",
        "sdb:PutAttributes",
        "sdb:ListDomains",
        "sdb:CreateDomain",
        "sdb:Select"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}