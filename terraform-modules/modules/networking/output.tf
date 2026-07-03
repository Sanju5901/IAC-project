output "virtual_network_name" {
  description = "The virtual network name."
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  description = "The subnet name."
  value       = azurerm_subnet.subnet.name
}

output "subnet_id" {
  description = "The subnet ID."
  value       = azurerm_subnet.subnet.id
}