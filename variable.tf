
variable "trusted_user_arns" {
  type    = list(string)
  default = ["arn:aws:iam::240851516795:user/abhi987"] # The IAM user in the *other* account
}

variable "mfa_enabled" {
  description = "Enable MFA requirement to assume the role"
  type        = bool
  default     = false
}

variable "mfa_age" {
  description = "Max age of MFA authentication in seconds"
  type        = number
  default     = 300
}

variable "cross_account_policy_permissions" {
  description = "List of IAM permissions to grant"
  type        = list(string)
}

variable "cross_account_policy_resources" {
  description = "List of resource ARNs or '*'"
  type        = list(string)
}

variable "cross_account_iam_policy_name" {
  description = "Name of the IAM inline policy"
  type        = string
}

variable "cross_account_access_role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "cross_account_access_role_description" {
  description = "Description for the IAM role"
  type        = string
  default     = "Cross-account role for trusted accounts"
}

variable "cross_account_access_role_path" {
  description = "Path for the IAM role"
  type        = string
  default     = "/"
}

variable "cross_account_access_role_max_session_duration" {
  description = "Session duration in seconds (up to 43200)"
  type        = number
  default     = 3600
}
