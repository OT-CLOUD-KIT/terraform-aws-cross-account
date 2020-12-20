data aws_iam_policy_document cross_account_assume_role_policy_document {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.trusted_account_ids
    }
    dynamic condition {
      for_each = var.mfa_enabled == true ? [1] : []
      content {
        test     = "Bool"
        variable = "aws:MultiFactorAuthPresent"
        values   = ["true"]
      }
    }
    dynamic condition {
      for_each = var.mfa_enabled == true ? [1] : []
      content {
        test     = "NumericLessThan"
        variable = "aws:MultiFactorAuthAge"
        values   = ["${var.mfa_age}"]
      }
    }

  }
}

data aws_iam_policy_document cross_account_iam_policy_document {

  statement {
    effect    = "Allow"
    actions   = var.cross_account_policy_permissions
    resources = var.cross_account_policy_resources
  }

}

resource aws_iam_role_policy cross_account_iam_policy {
  name   = var.cross_account_iam_policy_name
  role   = aws_iam_role.cross_account_access_role.id
  policy = data.aws_iam_policy_document.cross_account_iam_policy_document.json
}

resource aws_iam_role cross_account_access_role {
  name                 = var.cross_account_access_role_name
  description          = var.cross_account_access_role_description
  path                 = var.cross_account_access_role_path
  max_session_duration = var.cross_account_access_role_max_session_duration
  assume_role_policy   = data.aws_iam_policy_document.cross_account_assume_role_policy_document.json
}
