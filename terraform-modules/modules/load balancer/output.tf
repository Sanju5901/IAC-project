output "load_balancer_id" {
  description = "The load balancer ID."
  value       = azurerm_lb.web_lb.id
}

output "backend_address_pool_id" {
  description = "The load balancer backend address pool ID."
  value       = azurerm_lb_backend_address_pool.web_lb_pool.id
}