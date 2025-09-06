# variable "trusted_account_ids" {
#   type = list(string)
# }

variable "trusted_user_arns" {
  type    = list(string)
  default = ["arn:aws:iam::240851516795:user/abhi987"] # The IAM user in the *other* account
}


variable "mfa_enabled" {
  type    = bool
  default = false
}

variable "mfa_age" {
  type    = number
  default = 300
}

variable "cross_account_policy_permissions" {
  type = list(string)
}

variable "cross_account_policy_resources" {
  type = list(string)
}

variable "cross_account_iam_policy_name" {
  type = string
}

variable "cross_account_access_role_name" {
  type = string
}

variable "cross_account_access_role_description" {
  type    = string
  default = "Cross-account role"
}

variable "cross_account_access_role_path" {
  type    = string
  default = "/"
}

variable "cross_account_access_role_max_session_duration" {
  type    = number
  default = 3600
}
