# output "instance_publicip" {
#   description = "ECT instance public ip"
#   value       = aws_instance.myec2vm.public_ip
# }

# output "instance_publicdns" {
#   description = "ECT instance public dns"
#   value       = aws_instance.myec2vm.public_dns
# }

# output "for_output_list" {
#   description = "For loop with list"
#   value = [for instance in aws_instance.myec2vm: instance.public_dns]
# }
