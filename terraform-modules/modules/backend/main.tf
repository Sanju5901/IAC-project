resource "azurerm_public_ip" "web_vm_publicip" {
  name                = "${var.resource_name_prefix}-publicip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}