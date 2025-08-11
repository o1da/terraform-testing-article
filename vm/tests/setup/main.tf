terraform {
  required_version = ">= 1.12.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

resource "random_string" "random" {
  length  = 4
  special = false
}

module "network_customer" {
  source = "../../../network"

  base_name = "openstack-mod-test-${random_string.random.result}"
  cidr      = "10.10.0.0/24"
}

output "suffix" {
  value = random_string.random.id
}

output "subnet" {
  value = module.network_customer.subnet
}
