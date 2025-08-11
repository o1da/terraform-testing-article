run "default" {
  command = plan

  variables {
    base_name = "openstack-test"
    cidr      = "10.10.0.0/24"
  }

  assert {
    condition     = openstack_networking_network_v2.main.name == "openstack-test-net"
    error_message = "Wrong network name"
  }

  assert {
    condition     = output.network_name == "openstack-test-net"
    error_message = "Wrong network name in output"
  }

  assert {
    condition     = openstack_networking_subnet_v2.main.name == "openstack-test-subnet"
    error_message = "Wrong subnet name"
  }

  assert {
    condition     = openstack_networking_subnet_v2.main.cidr == "10.10.0.0/24"
    error_message = "Wrong subnet cidr"
  }

  assert {
    condition     = openstack_networking_subnet_v2.main.ip_version == 4
    error_message = "Wrong subnet ip_version"
  }

  assert {
    condition     = openstack_networking_network_v2.main.admin_state_up == true
    error_message = "Wrong network admin state"
  }

  assert {
    condition     = openstack_networking_subnet_v2.main.enable_dhcp == false
    error_message = "Wrong subnet dhcp state"
  }
}

run "wrong_config" {
  command = plan

  variables {
    base_name = "openstack-test"
    cidr      = "10.10.0.xxx/24"
  }

  expect_failures = [
    var.cidr,
  ]
}
