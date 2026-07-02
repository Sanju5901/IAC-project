resource "azurerm_resource_group" "myrg" {
  name = "${var.resource_name_prefix}-${var.name}" #sap-dev-gopal-rg
  #business division + environment + name of the resource group
  location = var.location
  tags = var.tags

}
