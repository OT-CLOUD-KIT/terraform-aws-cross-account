output "role_arn" {
  description = "ARN of the created IAM role"
  value       = aws_iam_role.cross_account_access_role.arn
}

output "role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.cross_account_access_role.name
}
