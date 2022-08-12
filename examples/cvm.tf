# CVM instance usages

data "tencentcloud_images" "imgs" {}
data "tencentcloud_instance_types" "ins_types" {}
data "tencentcloud_instances" "ins" {}

output "images" {
  value = lookup(data.tencentcloud_images.imgs, module.tc_data.images)
}

output "cvm_types" {
  value = lookup(data.tencentcloud_instance_types, module.tc_data.instance_types)
}

output "cvm_list" {
  value = lookup(data.tencentcloud_instances, module.tc_data.instances)
}