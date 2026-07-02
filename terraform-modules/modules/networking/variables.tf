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

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
}