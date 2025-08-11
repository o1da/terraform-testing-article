output "internal_ip" {
  value = openstack_compute_instance_v2.main.network[0].fixed_ip_v4

  precondition {
    condition     = provider::assert::ipv4(openstack_compute_instance_v2.main.network[0].fixed_ip_v4)
    error_message = "Invalid IP address"
  }
}
