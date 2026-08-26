locals {
  specific_tags = {
    "description" = var.description_tag
  }

  parent_tags = { for n, v in data.azurerm_resource_group.vnet_resource_group.tags : n => v if n != "description" }
  tags        = { for n, v in merge(local.parent_tags, local.specific_tags) : n => v if v != "" }
}

# create link to vnet
resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  provider = azurerm.hub

  for_each = local.private_dns_zone_map_filter

  name                = "${each.key}-link-${local.vnet_name}"
  private_dns_zone_id = each.value.id
  virtual_network_id  = data.azurerm_virtual_network.vnet.id
  tags                = local.tags
}
