# Terraform AWS Cross Account Role

A Terraform module to securely create and manage a cross-account IAM role in AWS, enabling trusted AWS accounts to assume roles with controlled permissions and optional Multi-Factor Authentication (MFA).

---

## Architecture



> **Note:**
> This diagram represents a cross-account access setup, where a trusted AWS account can securely assume a role in another AWS account with MFA enforcement and fine-grained permissions.

---

## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1|

---

## Usage

```hcl
module "cross_account_role" {
  source = "OT-CLOUD-KIT/terraform-aws-cross-account-role"

  trusted_account_arn = [
    "arn:aws:iam::240851516795:user/abhi987"
  ]

  mfa_enabled = true
  mfa_age     = 300

  cross_account_policy_permissions = [
    "ec2:DescribeInstances",
    "s3:ListAllMyBuckets"
  ]

  cross_account_policy_resources = ["*"]

  cross_account_iam_policy_name              = "CrossAccountAccessPolicy"
  cross_account_access_role_name             = "CrossAccountAccessRole"
  cross_account_access_role_description      = "Allows cross-account assume role"
  cross_account_access_role_path             = "/cross/"
  cross_account_access_role_max_session_duration = 3600
}
```

> **Note:**
> This example demonstrates how to configure the module with MFA and basic cross-account permissions.

---

## Resources

| Name                                                                                                                  | Type     |
| --------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws\_iam\_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                | resource |
| [aws\_iam\_role\_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_trusted_account_arn"></a> [trusted\_account\_arn](#input\_trusted\_account\_arn) | List of AWS account ARNs allowed to assume the role | `list(string)` | `[]` | Yes |
| <a name="input_mfa_enabled"></a> [mfa\_enabled](#input\_mfa\_enabled) | Enforce MFA when assuming the role | `bool` | `false` | Yes |
| <a name="input_mfa_age"></a> [mfa\_age](#input\_mfa\_age) | Max age (in seconds) of the MFA authentication | `number` | `300` |No |
| <a name="input_cross_account_policy_permissions"></a> [cross\_account\_policy\_permissions](#input\_cross\_account\_policy\_permissions) | List of IAM permissions granted by the role | `list(string)` | `[]` | Yes |
| <a name="input_cross_account_policy_resources"></a> [cross\_account\_policy\_resources](#input\_cross\_account\_policy\_resources) | List of resource ARNs the permissions apply to | `list(string)` | `[]` | Yes |
| <a name="input_cross_account_iam_policy_name"></a> [cross\_account\_iam\_policy\_name](#input\_cross\_account\_iam\_policy\_name) | Name of the inline IAM policy | `string` | `"CrossAccountAccessPolicy"` | Yes |
| <a name="input_cross_account_access_role_name"></a> [cross\_account\_access\_role\_name](#input\_cross\_account\_access\_role\_name) | Name of the IAM role to create | `string` | `"CrossAccountAccessRole"` | Yes |
| <a name="input_cross_account_access_role_description"></a> [cross\_account\_access\_role\_description](#input\_cross\_account\_access\_role\_description) | Description of the IAM role | `string` | `"Allows cross-account assume role"` |No |
| <a name="input_cross_account_access_role_path"></a> [cross\_account\_access\_role\_path](#input\_cross\_account\_access\_role\_path) | Path for the IAM role | `string` | `"/cross/"` |No |
| <a name="input_cross_account_access_role_max_session_duration"></a> [cross\_account\_access\_role\_max\_session\_duration](#input\_cross\_account\_access\_role\_max\_session\_duration) | Max session duration for assuming role (in seconds) | `number` | `3600` |No |

---
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cross_account_role_arn"></a> [cross\_account\_role\_arn](#output\_cross\_account\_role\_arn) | ARN of the created cross-account IAM role |
| <a name="output_cross_account_role_name"></a> [cross\_account\_role\_name](#output\_cross\_account\_role\_name) | Name of the created IAM role |

---

## Contributors

* [Nikita Joshi](https://github.com/jnikita19)
* [Piyush Upadhyay](https://github.com/piiiyuushh)
