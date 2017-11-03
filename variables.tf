variable "instance_count" {
  description = "Number of instance to deploy"
  default     = 1
}

variable "app_shortnames" {
  description = "Instance Name following convention"
  type        = "list"
}

variable "associate_public_ip_address" {
  type    = "string"
  default = false
}

variable "iam_instance_profile" {
  type    = "string"
  default = ""
}

variable "app_project_tag" {
  description = "HPC project Tag"
  type        = "string"
}

variable "user_sg_ids" {
  description = "List of security_group_id to add on instance"
  type        = "list"
  default     = [""]
}

variable "aws_instance_type" {
  description = "AWS instance type"
  type        = "string"
}

variable "aws_vpc" {
  description = "AWS VPC to launch ressources."
  type        = "string"
}

variable "aws_subnets" {
  description = "AWS subnets to launch servers."
  type        = "list"
}

variable "aws_key_name" {
  description = "Desired name of AWS key pair to use"
}

variable "aws_amis" {
  description = "AMI to use, here is the last terraform build"

  default = {
    eu-west-1      = "ami-db0588ac"
    ap-southeast-1 = "ami-106aa373"
  }
}

variable "aws_unixbase" {
  description = "security_goup to use by default"
}

variable "master_state_file" {
  description = "Master state file name"
}
