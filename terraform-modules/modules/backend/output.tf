output "public_ip_id" {
  description = "The public IP ID."
  value       = azurerm_public_ip.web_vm_publicip.id
}

output "public_ip_address" {
  description = "The public IP address."
  value       = azurerm_public_ip.web_vm_publicip.ip_address
}