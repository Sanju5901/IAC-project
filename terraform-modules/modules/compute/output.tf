output "network_interface_ids" {
  description = "NIC IDs keyed by instance name."
  value       = { for key, nic in azurerm_network_interface.web_nic : key => nic.id }
}

output "nic_ip_configuration_names" {
  description = "NIC IP configuration names keyed by instance name."
  value       = { for key, nic in azurerm_network_interface.web_nic : key => nic.ip_configuration[0].name }
}

output "virtual_machine_ids" {
  description = "Linux VM IDs keyed by instance name."
  value       = { for key, vm in azurerm_linux_virtual_machine.web_vm : key => vm.id }
}