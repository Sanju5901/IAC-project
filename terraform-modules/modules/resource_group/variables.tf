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

variable "vm_size" {
  description = "The size of the virtual machine by environment."
  type        = map(string)
  default = {
    dev  = "Standard_B1s"
    test = "Standard_F2"
    prod = "Standard_D2s_v3"
  }
}

variable "suzuki" {
  description = "Map of virtual machine instances to create."
  type        = map(string)
  default = {
    "vitara"  = "maruti"
    "wagonr"  = "maruti"

  }
}