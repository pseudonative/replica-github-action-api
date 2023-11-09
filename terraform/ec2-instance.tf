resource "aws_instance" "myec2vm" {
  ami           = data.aws_ami.amzlinux2.id
#   instance_type = var.instance_type
#   instance_type = var.instance_type_list[1]
  instance_type = var.instance_type_map["dev"]
  user_data     = file("${path.module}/app1-install.sh")
  key_name      = var.instance_keypair
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]
  count = 1
  tags = {
    "Name" = "${var.Name}_v2.2.0_${count.index}"
    Service = "reusableWorkflow"
    Environment = "GithubActionsWorkflow"
  }
  provider = aws.us-east-1
}

output "for_output_map1" {
  description = "For loop with map"
  value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}

output "for_output_map2" {
  description = "For loop with map - advanced"
  value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}

output "legacy_splat_instance_publicdns" {
  description = "legacy splat operator"
  value = aws_instance.myec2vm.*.public_dns
}

output "latest_splat_instance_publicdns" {
  description = "latest splat operator"
  value = aws_instance.myec2vm[*].public_dns
}

