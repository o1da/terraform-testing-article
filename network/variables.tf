variable "base_name" {
  type        = string
  description = "Base name for components"
}

variable "cidr" {
  type        = string
  description = "CIDR block for the subnet"

  validation {
    condition     = provider::assert::cidrv4(var.cidr)
    error_message = "Invalid CIDR block format"
  }
}
