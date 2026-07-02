resource "azurerm_lb" "web_lb" {
  name                = "${var.resource_name_prefix}-weblb"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_id
  }
}

resource "azurerm_lb_backend_address_pool" "web_lb_pool" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "${var.resource_name_prefix}-weblbpool"
}

resource "azurerm_lb_probe" "web_lb_probe" {
  loadbalancer_id     = azurerm_lb.web_lb.id
  name                = "${var.resource_name_prefix}-weblbprobe"
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 30
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "web_lb_rule" {
  loadbalancer_id                = azurerm_lb.web_lb.id
  name                           = "${var.resource_name_prefix}-weblbrule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.web_lb_pool.id]
  probe_id                       = azurerm_lb_probe.web_lb_probe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_association" {
  for_each                = var.network_interface_ids
  network_interface_id    = each.value
  ip_configuration_name   = var.nic_ip_configuration_names[each.key]
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_pool.id
}