# Basic VM module

This resource module is used to create bastion and router VMs.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.0 |
| <a name="requirement_assert"></a> [assert](#requirement\_assert) | ~> 0.16.0 |
| <a name="requirement_ct"></a> [ct](#requirement\_ct) | ~> 0.13 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 3.3.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ct"></a> [ct](#provider\_ct) | ~> 0.13 |
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | ~> 3.3.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~> 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [openstack_compute_instance_v2.main](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2) | resource |
| [openstack_compute_keypair_v2.ssh_keypair](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_keypair_v2) | resource |
| [openstack_networking_port_v2.ext](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_port_v2) | resource |
| [openstack_networking_port_v2.main](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_port_v2) | resource |
| [openstack_networking_secgroup_rule_v2.ssh](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_v2.ssh](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_v2) | resource |
| [tls_private_key.ssh_keypair](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [ct_config.config](https://registry.terraform.io/providers/poseidon/ct/latest/docs/data-sources/config) | data source |
| [ct_config.link_local_config](https://registry.terraform.io/providers/poseidon/ct/latest/docs/data-sources/config) | data source |
| [ct_config.rln_config](https://registry.terraform.io/providers/poseidon/ct/latest/docs/data-sources/config) | data source |
| [openstack_images_image_v2.main](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/images_image_v2) | data source |
| [openstack_networking_network_v2.ext](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/networking_network_v2) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_name"></a> [base\_name](#input\_base\_name) | Base name for components | `string` | n/a | yes |
| <a name="input_external_network_name"></a> [external\_network\_name](#input\_external\_network\_name) | Name of the external network - used to create another port and attach it to the VM | `string` | n/a | yes |
| <a name="input_inside_rln"></a> [inside\_rln](#input\_inside\_rln) | toggle to determine if the VM is inside RLN - eventually passing different config via cloud-init | `bool` | `false` | no |
| <a name="input_link_local"></a> [link\_local](#input\_link\_local) | toggle to determine if the VM is on link-local network - eventually passing different config via cloud-init | `bool` | `false` | no |
| <a name="input_router_config"></a> [router\_config](#input\_router\_config) | Router configuration.<br/>Example:<pre>hcl<br/>router_config = {<br/>  proxy_ip = "10.10.0.200"<br/>}</pre>The following fields are supported:<br/>  * `router_config` - (Optional) Router configuration object containing:<br/>    * `proxy_ip` - (Optional) IP address of the proxy server | <pre>object({<br/>    proxy_ip = optional(string, null)<br/>  })</pre> | `null` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | Subnet configuration - pass openstack\_networking\_subnet\_v2 resource | <pre>object({<br/>    id         = string<br/>    network_id = string<br/>    name       = string<br/>    cidr       = string<br/>  })</pre> | n/a | yes |
| <a name="input_vm_ip"></a> [vm\_ip](#input\_vm\_ip) | Static IP address for the VM. If null, .43 in the current subnet | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | n/a |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | n/a |
| <a name="output_tls_private_key"></a> [tls\_private\_key](#output\_tls\_private\_key) | n/a |
<!-- END_TF_DOCS -->
