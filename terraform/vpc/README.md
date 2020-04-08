## How To

```bash

## Initiate Terraform, only execute when you're first time running this.
aws-vault exec deleteit -- make init

## Plan will show the result about what's gonna change.
aws-vault exec deleteit -- make plan

## Apply will deploy to online environment which base on your plan result.
aws-vault exec deleteit -- make apply

## If you changed the Terraform modules, please run update to fetch the newest module.
aws-vault exec deleteit -- make update

```


## State

The state of this project will store in `terraform.tfstate` this file, and Terraform will 
do every changes base on this state file. So, DO NOT CHANGE IT MANUALLY! 


## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| AWS\_REGION | Region | `string` | `"eu-west-2"` | no |
| app\_a\_cidr | # APP\_Subnets | `any` | n/a | yes |
| app\_b\_cidr | n/a | `any` | n/a | yes |
| app\_c\_cidr | n/a | `any` | n/a | yes |
| app\_subnet\_tags | n/a | `any` | n/a | yes |
| office\_ip | # Office IP | `list` | n/a | yes |
| public\_a\_cidr | # Public Subnets | `any` | n/a | yes |
| public\_b\_cidr | n/a | `any` | n/a | yes |
| public\_c\_cidr | n/a | `any` | n/a | yes |
| public\_subnet\_tags | n/a | `any` | n/a | yes |
| vpc\_cidr | VPC CIDR | `any` | n/a | yes |
| vpc\_name | VPC Name | `any` | n/a | yes |
| vpc\_tags | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| office\_sg\_id | n/a |
| subnet\_app\_a\_id | n/a |
| subnet\_app\_b\_id | n/a |
| subnet\_app\_c\_id | n/a |
| subnet\_public\_a\_id | n/a |
| subnet\_public\_b\_id | n/a |
| subnet\_public\_c\_id | n/a |
| vpc\_cidr | n/a |
| vpc\_id | n/a |

