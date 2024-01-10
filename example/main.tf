module "link_dns" {
  source = "../"

  providers = {
    azurerm.hub = azurerm.hub
  }

  disaster_recovery = false
  vnet_id           = "/subscriptions/6ff7089b-cdc2-4513-bfd9-39d707ea3748/resourceGroups/d10cghf915/providers/Microsoft.Network/virtualNetworks/d10cghf915vnet"

}
