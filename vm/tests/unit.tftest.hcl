run "default" {
  command = plan

  variables {
    vm_ip     = "10.10.0.100"
    base_name = "openstack-mod-test-vm"
    subnet = {
      id         = "c0a8f0a1-0000-0000-0000-000000000001" # random UUID
      network_id = "c0a8f0a1-0000-0000-0000-000000000002" # random UUID
      name       = "openstack-mod-test-subnet"
      cidr       = "10.10.0.0/24"
    }
  }

  assert {
    condition     = openstack_compute_instance_v2.main.name == var.base_name
    error_message = "Wrong machine name"
  }

  assert {
    condition     = openstack_networking_port_v2.main.name == "openstack-mod-test-vm-net"
    error_message = "Wrong port name - net"
  }

  assert {
    condition     = openstack_compute_instance_v2.main.flavor_name == "a1-ram2-disk20-perf1"
    error_message = "Wrong machine flavor"
  }

  assert {
    condition     = openstack_compute_instance_v2.main.image_id == data.openstack_images_image_v2.main.id
    error_message = "Wrong machine image"
  }

  assert {
    condition     = data.openstack_images_image_v2.main.properties["os_version"] == "24.04"
    error_message = "Wrong machine image distro"
  }

  assert {
    condition     = data.openstack_images_image_v2.main.properties["os_distro"] == "ubuntu"
    error_message = "Wrong machine image distro"
  }

  assert {
    condition     = openstack_compute_instance_v2.main.metadata == tomap({ "application" = "openstack-mod-test-vm" })
    error_message = "Wrong machine metadata"
  }

  assert {
    condition     = length(openstack_compute_instance_v2.main.network[*]) == 1
    error_message = "Wrong number of networks"
  }

  assert {
    condition     = openstack_networking_port_v2.main.admin_state_up == true
    error_message = "Wrong port admin state"
  }

  assert {
    condition     = openstack_networking_port_v2.main.network_id == var.subnet.network_id
    error_message = "Wrong port network id"
  }

  assert {
    condition     = one(openstack_networking_port_v2.main.fixed_ip[*]).subnet_id == var.subnet.id
    error_message = "Wrong port subnet id"
  }

  assert {
    condition     = one(openstack_networking_port_v2.main.fixed_ip[*]).ip_address == "10.10.0.100"
    error_message = "Wrong port ip address"
  }
}

run "wrong_config" {
  command = plan

  variables {
    vm_ip     = "xxx"
    base_name = "openstack-mod-test-vm"
    subnet = {
      id         = "xxx"
      network_id = "xxx"
      name       = ""
      cidr       = "162.132.241.00/240"
    }
  }

  expect_failures = [
    var.vm_ip,
    var.subnet,
  ]
}
