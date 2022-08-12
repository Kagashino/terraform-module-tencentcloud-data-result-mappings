# Available regions and zones usages

data "availability_regions" "regions" {}

data "tencentcloud_availability_zones_by_product" "az" {
  product = "cvm"
}

output "regions" {
  value = lookup(data.availability_regions.regions, module.tc_data.availability_regions)
}

output "az_list" {
  value = lookup(data.tencentcloud_availability_zones_by_product.az, module.tc_data.availability_zones_by_product)
}