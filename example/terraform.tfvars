trusted_user_arns = [

"arn:aws:iam::240851516795:user/abhi987"
]

mfa_enabled = true
mfa_age     = 300

cross_account_policy_permissions = [
  "ec2:DescribeInstances",
  "s3:ListAllMyBuckets"
]

cross_account_policy_resources = [
  "*"
]

cross_account_iam_policy_name = "CrossAccountAccessPolicy"

cross_account_access_role_name        = "CrossAccountAccessRole"
cross_account_access_role_description = "Allows cross-account assume role"
cross_account_access_role_path        = "/cross/"
cross_account_access_role_max_session_duration = 3600
