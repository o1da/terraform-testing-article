run "default" {
  command = apply

  variables {
    base_name = "openstack-test"
    cidr      = "10.10.0.0/24"
  }

  assert {
    condition     = openstack_networking_subnet_v2.main.network_id == openstack_networking_network_v2.main.id
    error_message = "Wrong network id"
  }

  assert {
    condition     = output.subnet != null
    error_message = "Missing subnet output"
  }

  assert {
    condition     = output.subnet.name == "openstack-test-subnet"
    error_message = "Wrong subnet name in output"
  }

  assert {
    condition     = openstack_networking_subnet_v2.main.cidr == "10.10.0.0/24"
    error_message = "Wrong subnet cidr"
  }

  assert {
    condition     = openstack_networking_subnet_v2.main.gateway_ip == "10.10.0.1"
    error_message = "Wrong subnet gateway ip"
  }

  assert {
    condition     = one(openstack_networking_subnet_v2.main.allocation_pool[*]).start == "10.10.0.2"
    error_message = "Wrong subnet allocation pool start"
  }

  assert {
    condition     = one(openstack_networking_subnet_v2.main.allocation_pool[*]).end == "10.10.0.254"
    error_message = "Wrong subnet allocation pool end"
  }
}
