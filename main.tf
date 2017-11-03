/**
 * ## Description : 
 * Deploy instance(s)
 * 
 * ## Components : 
 * - Instance(s)
 * - Security Group
 * 
 * ## Requirments
 * - provider AWS
 * - provider Template
 * - provider Credstash
 *
 */

#resource "aws_security_group" "dedicated" {
#  name        = "SRV-${element(var.app_shortnames, count.index)}"
#  description = "Dedicated SG for ${element(var.app_shortnames, count.index)} only !"
#  vpc_id      = "${var.aws_vpc}"
#
#  count = "${var.instance_count}"
#
#  tags {
#    Name             = "SRV-${element(var.app_shortnames, count.index)}"
#    PROJECT          = "${var.app_project_tag}"
#    TerraformTFState = "${var.master_state_file}"
#    Terraform        = "true"
#  }
#}

resource "aws_instance" "instance" {
  instance_type = "${var.aws_instance_type}"
  ami           = "${lookup(var.aws_amis, var.aws_region)}"
  key_name      = "${var.aws_key_name}"
  subnet_id     = "${var.aws_subnets[count.index%2]}"
  count         = "${var.instance_count}"

  #vpc_security_group_ids = ["${element(aws_security_group.dedicated.*.id, count.index)}", "${var.aws_unixbase}", "${compact(var.user_sg_ids)}"]
  vpc_security_group_ids = ["${var.aws_unixbase}", "${compact(var.user_sg_ids)}"]

  #Instance Extra features 
  iam_instance_profile        = "${var.iam_instance_profile}"
  associate_public_ip_address = "${var.associate_public_ip_address}"

  tags {
    Name             = "${element(var.app_shortnames, count.index)}"
    PROJECT          = "${var.app_project_tag}"
    TerraformTFState = "${var.master_state_file}"
    Terraform        = "true"
  }

  # Do not recreate instance if user_data change"
  lifecycle {
    ignore_changes = ["user_data"]
  }
}
