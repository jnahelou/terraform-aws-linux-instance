#AWS Credentials required for lockbox
variable "env" {
  description = "Environment to deploy app"
  type        = "string"
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  type        = "string"
}

provider "credstash" {
  table  = "credential-store-dev-${var.aws_region}"
  region = "eu-west-1"
}

####################
# AWS Requierments #
####################
data "credstash_secret" "access_key" {
  name = "access_key"

  context = {
    env    = "${var.env}"
    region = "${var.aws_region}"
  }
}

data "credstash_secret" "secret_key" {
  name = "secret_key"

  context = {
    env    = "${var.env}"
    region = "${var.aws_region}"
  }
}

provider "aws" {
  access_key = "${data.credstash_secret.access_key.value}"
  secret_key = "${data.credstash_secret.secret_key.value}"
  region     = "${var.aws_region}"
}
