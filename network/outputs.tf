output "network_name" {
  value = openstack_networking_network_v2.main.name
}

output "subnet" {
  value = openstack_networking_subnet_v2.main
}
