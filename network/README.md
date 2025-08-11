# Customer network module

This resource module is meant to create customer network on OpenStack. It can eventually creates a router and effectively connect the network to internet.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.0 |
| <a name="requirement_assert"></a> [assert](#requirement\_assert) | ~> 0.16.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | ~> 3.3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vm_router"></a> [vm\_router](#module\_vm\_router) | ../vm_basic/ | n/a |

## Resources

| Name | Type |
|------|------|
| [openstack_networking_network_v2.main](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_network_v2) | resource |
| [openstack_networking_subnet_v2.main](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnet_v2) | resource |
| [openstack_networking_subnetpool_v2.main](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnetpool_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_ip"></a> [base\_ip](#input\_base\_ip) | Base IP address for the subnet | `string` | n/a | yes |
| <a name="input_base_name"></a> [base\_name](#input\_base\_name) | Base name for components | `string` | n/a | yes |
| <a name="input_dns_nameservers"></a> [dns\_nameservers](#input\_dns\_nameservers) | List of DNS nameservers | `list(string)` | n/a | yes |
| <a name="input_router_config"></a> [router\_config](#input\_router\_config) | Router configuration.<br/>Example:<pre>hcl<br/>router_config = {<br/>  proxy_ip = "10.10.0.200"<br/>}</pre>The following fields are supported:<br/>  * `router_config` - (Optional) Router configuration object containing:<br/>    * `proxy_ip` - (Optional) IP address of the proxy server | <pre>object({<br/>    proxy_ip = optional(string, null)<br/>  })</pre> | `null` | no |
| <a name="input_subnet_mask"></a> [subnet\_mask](#input\_subnet\_mask) | Subnet mask for the network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_router_ip"></a> [external\_router\_ip](#output\_external\_router\_ip) | n/a |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | n/a |
| <a name="output_router_tls_private_key"></a> [router\_tls\_private\_key](#output\_router\_tls\_private\_key) | n/a |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |
<!-- END_TF_DOCS -->