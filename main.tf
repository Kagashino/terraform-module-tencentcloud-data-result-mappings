terraform {
  required_providers {
    # must declare tencentcloud providers to ensure provider schema command works.
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = "1.77.0"
    }
  }
}