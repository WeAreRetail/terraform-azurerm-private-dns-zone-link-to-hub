data "azurerm_resources" "private_dns_zone_hub" {
  provider = azurerm.hub

  type = "Microsoft.Network/privateDnsZones"
  required_tags = {
    A_REGION      = var.disaster_recovery ? "FRANCE" : "EUROPE"
    A_PROJECT     = "NET"
    A_ENVIRONMENT = "PRD"
  }
}

locals {
  vnet_resource_group = split("/", var.vnet_id)[4]
  vnet_name           = split("/", var.vnet_id)[8]
}

data "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  resource_group_name = local.vnet_resource_group
}

data "azurerm_resource_group" "vnet_resource_group" {
  name = local.vnet_resource_group
}

data "azurerm_private_dns_zone" "private_dns_zone_hub" {
  provider = azurerm.hub

  for_each = { for v in flatten(data.azurerm_resources.private_dns_zone_hub[*].resources) : v.id => v }

  name                = each.value.name
  resource_group_name = split("/", each.value.id)[4]
}

locals {
  private_dns_zone_map        = { for v in data.azurerm_private_dns_zone.private_dns_zone_hub : v.name => v }
  private_dns_zone_map_filter = { for k, v in local.private_dns_zone_map : k => v if !contains(var.dns_zones_exclude_list, k) }
}
