## Description :
Deploy instance(s)

## Components :
- Instance(s)
- Security Group

## Requirments
- provider AWS
- provider Template
- provider Credstash



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app_project_tag | HPC project Tag | string | - | yes |
| app_shortnames | Instance Name following convention | list | - | yes |
| associate_public_ip_address |  | string | `false` | no |
| aws_amis | AMI to use, here is the last terraform build | string | `<map>` | no |
| aws_instance_type | AWS instance type | string | - | yes |
| aws_key_name | Desired name of AWS key pair to use | string | - | yes |
| aws_region | AWS region to launch servers. | string | - | yes |
| aws_subnets | AWS subnets to launch servers. | list | - | yes |
| aws_unixbase | security_goup to use by default | string | - | yes |
| aws_vpc | AWS VPC to launch ressources. | string | - | yes |
| env | Environment to deploy app | string | `dev` | no |
| iam_instance_profile |  | string | `` | no |
| instance_count | Number of instance to deploy | string | `1` | no |
| master_state_file | Master state file name | string | - | yes |
| user_sg_ids | List of security_group_id to add on instance | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_ids |  |
| private_ips |  |
| public_ips |  |
| sg_ids |  |

