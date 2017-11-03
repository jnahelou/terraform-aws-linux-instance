output "private_ips" {
  #description = "Return a list which contain the first private_ip of deployed servers"
  value = ["${aws_instance.instance.*.private_ip}"]
}

output "public_ips" {
  #description = "Return a list which contain the first private_ip of deployed servers"
  value = ["${aws_instance.instance.*.public_ip}"]
}

output "instance_ids" {
  #description = "Return a list which contain the list of instance_id"
  value = ["${aws_instance.instance.*.id}"]
}

output "sg_ids" {
  #description = "Return a list which contain the list of security_group_id"
  value = ["${aws_security_group.dedicated.*.id}"]
}
