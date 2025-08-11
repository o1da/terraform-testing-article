terraform {
  required_version = ">= 1.12.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 3.3.0"
    }
    assert = {
      source  = "hashicorp/assert"
      version = "~> 0.16.0"
    }
  }
}
