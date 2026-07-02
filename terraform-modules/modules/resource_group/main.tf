resource "azurerm_resource_group" "myrg" {
  name = "${var.resource_name_prefix}-${var.name}" #sap-dev-gopal-rg
  #business division + environment + name of the resource group
  location = var.location
  tags = var.tags

}

module "networking" {
  source = "github.com/Sanju5901/IAC-project/terraform-modules/modules/networking"
  #source = "github.com/gopal1409/kyn-han-solo-july-module26/terraform-modules/modules/networking"

  resource_name_prefix = local.resource_name_prefix
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  tags                 = local.project_lucky
}

module "backend" {
source = "github.com/Sanju5901/IAC-project/terraform-modules/modules/backend"
  #source = "github.com/gopal1409/kyn-han-solo-july-module26/terraform-modules/modules/backend"

  resource_name_prefix = local.resource_name_prefix
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  tags                 = local.project_lucky
}

module "compute" {
    source = "github.com/Sanju5901/IAC-project/terraform-modules/modules/compute"
  #source = "github.com/gopal1409/kyn-han-solo-july-module26/terraform-modules/modules/compute"

  resource_name_prefix = local.resource_name_prefix
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  subnet_id            = module.networking.subnet_id
  instance_map         = var.suzuki
  vm_size              = var.vm_size[var.environment]
  tags                 = local.project_lucky
  ssh_public_key_path  = "${path.root}/ssh-keys/terraform-azure.pem.pub"
  custom_data_path     = "${path.root}/app/app.sh"
}

module "loadbalancer" {
    source = "github.com/Sanju5901/IAC-project/terraform-modules/modules/backend"
  #source = "github.com/gopal1409/kyn-han-solo-july-module26/terraform-modules/modules/loadbalancer"

  resource_name_prefix       = local.resource_name_prefix
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  public_ip_id               = module.backend.public_ip_id
  network_interface_ids      = module.compute.network_interface_ids
  nic_ip_configuration_names = module.compute.nic_ip_configuration_names
}