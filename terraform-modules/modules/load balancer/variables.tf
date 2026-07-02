variable "resource_name_prefix" {
  description = "Prefix used for resource names."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "public_ip_id" {
  description = "Public IP ID for the load balancer frontend."
  type        = string
}

variable "network_interface_ids" {
  description = "NIC IDs keyed by instance name."
  type        = map(string)
}

variable "nic_ip_configuration_names" {
  description = "NIC IP configuration names keyed by instance name."
  type        = map(string)
}