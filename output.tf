# define outputs
output "private_dns_zone_map" {
  value       = { for k, v in local.private_dns_zone_map_filter : k => v.id }
  description = "A key value map. Keys are the private dns zone name. Values are the IDs"
}
