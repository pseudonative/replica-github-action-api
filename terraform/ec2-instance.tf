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
    "Name" = "${var.Name}_ci_cd_${count.index}"
    Service = "CICD"
    Environment = "GithubActionsWorkflow"
  }
  provider = aws.us-east-1
}

#Terrform on AWS EKS Kubernetes IaC SRE- 50 Real-World Demos
#35.Step-03 