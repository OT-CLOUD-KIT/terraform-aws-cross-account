output "cross_account_role_name" {
  description = "The name of the IAM role created for cross-account access"
  value       = module.cross_account_role.role_name
}

output "cross_account_role_arn" {
  description = "The ARN of the IAM role created for cross-account access"
  value       = module.cross_account_role.role_arn
}
