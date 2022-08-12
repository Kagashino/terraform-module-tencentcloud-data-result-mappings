# VPC, Subnet and security groups usage

data "tencentcloud_vpc_instances" "instance" {}
data "tencentcloud_security_groups" "sgs" {}
data "tencentcloud_vpc_subnets" "subnet" {
  vpc_id = "vpc-xxxxxxxx"
}

output "vpc_list" {
  value = lookup(data.tencentcloud_vpc_instances.instance, module.tc_data.vpc_instances)
}

output "subnet_list" {
  value = lookup(data.tencentcloud_vpc_subnets, module.tc_data.vpc_subnets)
}

output "security_groups" {
  value = lookup(data.tencentcloud_security_groups.sgs, module.tc_data.security_groups)
}