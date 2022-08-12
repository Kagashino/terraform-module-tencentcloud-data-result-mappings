# Terraform Module TencentCloud Datasource result mappings
## What is this module?

This module provides most of `data "tencentcloud_*"` result keys e.g. `instance_list`, `list`, `xxxwhatever_list` mapping by its own data source name `*` as output values.  
We're using command `terraform providers schema -json` to auto-generate these output keys.

## Why we need this module?

Here shows the normal way to access TencentCloud datasources result:

```hcl
data "tencentcloud_vpc_instances" "instance" {}
data "tencentcloud_security_groups" "sg" {}

output "vpc_list" {
  value = data.tencentcloud_vpc_instances.instance.instance_list
}

output "security_groups" {
  value = tencentcloud_security_groups.sg.security_groups
}
```

You can see the vpc returns `instance_list` but sg returns `security_groups`. Oh, man! We cannot remember every data source list result keys!

So try to use this map:

```hcl
module "tc_data" {
  source = "../"
}

data "tencentcloud_vpc_instances" "instance" {}
data "tencentcloud_security_groups" "sgs" {}

output "vpc_list" {
  value = lookup(data.tencentcloud_vpc_instances.instance, module.tc_data.vpc_instances)
}

output "security_groups" {
  value = lookup(data.tencentcloud_security_groups.sgs, module.tc_data.security_groups)
}
```

Right now, we can exactly access this resource by the same data source name!

## What we will do in the future?

To unique output keys are important but there is a very long process, we hope this module will finish its mission in the near future.

## Based provider versions

- TencentCloud Provider `=1.77.0`

## Data Types

Please check the [./outputs.md](./outputs.md) for reference.