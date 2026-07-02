 variable "resource_name_prefix" {
  description = "Prefix for the resource name"
  type        = string
 
}

variable "name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags for the resource group"
  type        = map(string)
}

