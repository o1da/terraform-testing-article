resource "openstack_networking_network_v2" "main" {
  name           = "${var.base_name}-net"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "main" {
  name        = "${var.base_name}-subnet"
  enable_dhcp = false
  network_id  = openstack_networking_network_v2.main.id
  cidr        = var.cidr
}
