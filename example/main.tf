module "cross_account_role" {
  source = "../"
  trusted_user_arns              = var.trusted_user_arns
  mfa_enabled                       = var.mfa_enabled
  mfa_age                           = var.mfa_age
  cross_account_policy_permissions = var.cross_account_policy_permissions
  cross_account_policy_resources   = var.cross_account_policy_resources
  cross_account_iam_policy_name     = var.cross_account_iam_policy_name
  cross_account_access_role_name    = var.cross_account_access_role_name
  cross_account_access_role_description = var.cross_account_access_role_description
  cross_account_access_role_path         = var.cross_account_access_role_path
  cross_account_access_role_max_session_duration = var.cross_account_access_role_max_session_duration
}
