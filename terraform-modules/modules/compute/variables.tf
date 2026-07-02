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

variable "subnet_id" {
  description = "Subnet ID for NICs."
  type        = string
}

variable "instance_map" {
  description = "Map of virtual machine instances to create."
  type        = map(string)
}

variable "vm_size" {
  description = "Virtual machine size."
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
}

variable "ssh_public_key_path" {
  type = string
}

variable "custom_data_path" {
  type = string
}