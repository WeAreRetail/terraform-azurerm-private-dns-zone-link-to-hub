variable "description_tag" {
  type        = string
  description = "A description tag to add to the link."
  default     = "vNet link"
}

variable "disaster_recovery" {
  type        = bool
  description = "For disaster recovery infrastructure."
}

variable "dns_zones_exclude_list" {
  type        = list(string)
  description = "(Optional) A list of DNS Private Zone to not link."
  default = [
    "privatelink.azurewebsites.net",
    "privatelink.blob.core.windows.net",
    "privatelink.database.windows.net",
    "privatelink.dfs.core.windows.net",
    "privatelink.postgres.database.azure.com",
    "privatelink.vaultcore.azure.net",
  ]
}

variable "vnet_id" {
  type        = string
  description = "The vnet ID"
}
