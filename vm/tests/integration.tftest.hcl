run "setup" {
  command = apply

  module {
    source = "./tests/setup"
  }
}

run "create_vm" {
  command = apply

  variables {
    vm_ip     = "10.10.0.100"
    base_name = "openstack-mod-test-vm-${run.setup.suffix}"
    subnet    = run.setup.subnet
  }

  assert {
    condition     = openstack_compute_instance_v2.main.network[0].port == openstack_networking_port_v2.main.id
    error_message = "Internal port is not attached"
  }

  assert {
    condition     = output.internal_ip == "10.10.0.100"
    error_message = "Internal IP is wrong"
  }
}
