# Azure Aware Private DNS zone link to hub

[![Build Status](https://dev.azure.com/weareretail/Tooling/_apis/build/status/mod_azu_databricks?repoName=mod_azu_private_dns_zone_link_to_hub&branchName=master)](https://dev.azure.com/weareretail/Tooling/_build/latest?definitionId=11&repoName=mod_azu_private_dns_zone_link_to_hub&branchName=master)[![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)

Common Azure Terraform module to normalize Azure Databricks config setup.

# Usage

```hcl
module "databricks_config" {
  source  = "WeAreRetail/privat-dns-zone-link-to-hub/azurerm"
  version = "1.0.0"

  disaster_recovery = var.disaster_recovery
  vnet_id           = module.vnet.id
}
```

***Autogenerated file - do not edit***

#### Requirements

#### Inputs

#### Outputs

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.2 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disaster_recovery"></a> [disaster\_recovery](#input\_disaster\_recovery) | For disaster recovery infrastructure. | `bool` | n/a | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | The vnet ID | `string` | n/a | yes |
| <a name="input_description_tag"></a> [description\_tag](#input\_description\_tag) | A description tag to add to the link. | `string` | `"vNet link"` | no |
| <a name="input_dns_zones_exclude_list"></a> [dns\_zones\_exclude\_list](#input\_dns\_zones\_exclude\_list) | (Optional) A list of DNS Private Zone to not link. | `list(string)` | <pre>[<br>  "privatelink.azurewebsites.net",<br>  "privatelink.blob.core.windows.net",<br>  "privatelink.database.windows.net",<br>  "privatelink.dfs.core.windows.net",<br>  "privatelink.postgres.database.azure.com",<br>  "privatelink.vaultcore.azure.net"<br>]</pre> | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_zone_map"></a> [private\_dns\_zone\_map](#output\_private\_dns\_zone\_map) | A key value map. Keys are the private dns zone name. Values are the IDs |
<!-- END_TF_DOCS -->