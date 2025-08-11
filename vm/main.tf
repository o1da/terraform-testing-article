data "openstack_images_image_v2" "main" {
  name = "Ubuntu 24.04 LTS Noble Numbat"
}

resource "openstack_networking_port_v2" "main" {
  name           = "${var.base_name}-net"
  admin_state_up = "true"
  network_id     = var.subnet.network_id

  fixed_ip {
    subnet_id  = var.subnet.id
    ip_address = var.vm_ip
  }
}

resource "openstack_compute_instance_v2" "main" {
  name        = var.base_name
  flavor_name = "a1-ram2-disk20-perf1"
  image_id    = data.openstack_images_image_v2.main.id

  metadata = {
    application = var.base_name
  }

  network {
    port = openstack_networking_port_v2.main.id
  }

  lifecycle {
    postcondition {
      condition     = self.power_state == "active"
      error_message = "VM did not start successfully"
    }
  }
}
