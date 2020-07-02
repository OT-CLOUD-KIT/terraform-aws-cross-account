variable mfa_enabled {
  description = "Enable MFA for cross account access"
  type        = bool
  default     = false
}

variable mfa_age {
  description = "Max age of valid MFA (in seconds) for roles which require MFA"
  default     = 86400
}

variable trusted_account_ids {
  description = "List of account ids which can assume cross account role"
  type        = list
}

variable cross_account_iam_policy_name {
  description = "Name of cross account access iam policy"
  default     = "cross_account_iam_policy"
}

variable cross_account_policy_permissions {
  description = "List of permissions granted to cross account role"
  type        = list
}

variable cross_account_policy_resources {
  description = "List of AWS resources on which permission will be applied"
  type        = list
  default     = ["*"]
}

variable cross_account_access_role_name {
  description = "Name of cross account access iam role"
  default     = "cross_account_access_role"
}

variable cross_account_access_role_description {
  description = "IAM role description"
  default     = "IAM Role which will allow trusted AWS accounts to assume it"
}

variable cross_account_access_role_max_session_duration {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  default     = "3600"
}

variable cross_account_access_role_path {
  description = "Path of cross account IAM role"
  default     = "/"
}
