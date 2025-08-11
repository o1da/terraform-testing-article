variable "vm_ip" {
  type        = string
  description = "Static IP address for the VM"

  validation {
    condition     = provider::assert::ipv4(var.vm_ip)
    error_message = "Invalid IP address"
  }
}

variable "base_name" {
  type        = string
  description = "Base name for components"
}

variable "subnet" {
  type = object({
    id         = string
    network_id = string
    name       = string
    cidr       = string
  })
  description = "Subnet configuration - pass openstack_networking_subnet_v2 resource"

  validation {
    condition     = provider::assert::regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.subnet.id)
    error_message = "Invalid subnet ID format"
  }

  validation {
    condition     = provider::assert::regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.subnet.network_id)
    error_message = "Invalid network ID format"
  }

  validation {
    condition     = var.subnet.name != ""
    error_message = "Subnet name cannot be empty"
  }

  validation {
    condition     = provider::assert::cidrv4(var.subnet.cidr)
    error_message = "Invalid CIDR format"
  }
}
