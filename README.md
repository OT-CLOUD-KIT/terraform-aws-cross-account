AWS Cross Account IAM role module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates IAM role in target account which will allow user specified AWS accounts to assume it and can access resources according to permission attached to this role

Terraform versions
------------------

Terraform 0.12.

Usage
------

```hcl
provider "aws" {
  region                  = "ap-south-1"
}

module "cross_account_iam_role" {
  source = "../"

  cross_account_access_role_name = "cross_account_iam_role"
  trusted_account_ids = ["8763103198","1293216333"]
  cross_account_policy_permissions = ["s3:ListAllMyBuckets","s3:GetBucketLocation"]
  cross_account_policy_resources = ["arn:aws:s3:::*"]
  mfa_enabled = true
  mfa_age = 3600
}

```

```
output "vpc_id" {
  value       = module.cross_account_role.cross_account_access_role_id
}

output "vpc_arn" {
  value       = module.cross_account_role.cross_account_access_role_arn
}
```
Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| trusted_account_ids | List of account ids which can assume cross account role | `list` | No default value | yes |
| cross_account_policy_permissions | List of permissions granted to cross account role | `list` | No default value | yes |
| cross_account_policy_resources |List of AWS resources on which permission will be applied | `list` | ["*"] | no |
| cross_account_access_role_name | Name of cross acccount iam role | `string` | `"cross_account_access_role"` | no |
| cross_account_access_role_description | Description of cross acccount iam role | `string` | `"IAM Role which will allow trusted AWS accounts to assume it"` | no |
| cross_account_access_role_max_session_duration | Maximum CLI/API session duration in seconds between 3600 and 43200 | `string` | `"3600"` | no |
| cross_account_access_role_path | Path of cross account IAM role | `string` | `"/"` | no |
| cross_account_iam_policy_name | Name of cross account access iam policy | `string` | `"cross_account_iam_policy"` | no |
| mfa_enabled | Enable MFA for cross account access | `boolean` | `"false"` | no |
| mfa_age |Max age of valid MFA (in seconds) for roles which require MFA| `string` | `"86400"` | no |

Output
------
| Name | Description |
|------|-------------|
| cross_account_access_role_id | The ID of the IAM Role |
| cross_account_access_role_arn | The arn of the IAM role |

### Contributors
#### Rajat Vats (rajat.vats@opstree.com)
