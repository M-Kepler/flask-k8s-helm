## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| AWS\_REGION | Region | `string` | `"ap-northeast-1"` | no |
| app\_a\_cidr | # APP\_Subnets | `any` | n/a | yes |
| app\_b\_cidr | n/a | `any` | n/a | yes |
| db\_a\_cidr | # DB\_Subnets | `any` | n/a | yes |
| db\_b\_cidr | n/a | `any` | n/a | yes |
| public\_a\_cidr | # Public Subnets | `any` | n/a | yes |
| public\_b\_cidr | n/a | `any` | n/a | yes |
| redis\_a\_cidr | # Redis\_Subnets | `any` | n/a | yes |
| redis\_b\_cidr | n/a | `any` | n/a | yes |
| vpc\_cidr | VPC CIDR | `any` | n/a | yes |
| vpc\_name | VPC Name | `any` | n/a | yes |

## Outputs

No output.

