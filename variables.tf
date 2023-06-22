### [BEGIN] variables.tf ###
variable "create_resource_group" {
  description = <<EOD
  [Optional] If set to `true`, a resource group will be created for the vnet. Default is `false`.
  EOD
  type        = bool
  default     = false
}
variable "resource_group_name" {
  description = <<EOD
  [Optional] The name of an existing resource group in which to provision the virtual network. If ommitted, a new resource group will be created.
  EOD
  type        = string
  default     = null
}

variable "address_space" {
  description = <<EOD
  [Optional] The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created. Must be provided in CIDR notation.
  EOD
  type        = list(string)
  default     = []
}

variable "dns_servers" {
  description = <<EOD
  [Optional] A list of DNS servers to associate with the virtual network. Changing this forces a new resource to be created.
  EOD
  type        = list(string)
  default     = []
}

variable "enable_default_subnet" {
  description = <<EOD
  [Optional] If set to false, the default subnet will not be created. Changing this forces a new resource to be created.
  EOD
  type        = bool
  default     = true
}

variable "address_prefixes" {
  description = <<EOD
  [Optional] A list of address prefixes to use when `enable_default_subnet` is `true`. Must be provided in CIDR notation.
  EOD
  type        = list(string)
  default     = []
}

variable "security_groups" {
  description = <<EOD
  [Optional] A list of security group names to attach to the default subnet. 
  EOD
  type        = list(string)
  default     = []
}

variable "resource_group_label" {
  description = <<EOD
  [Set] azurerm_resource_group label
  EOD
  type = object({
    name            = optional(string)
    attributes      = optional(list(string))
    label_order     = optional(list(string))
    id_length_limit = optional(number)
  })
  default = {
    name        = "rg"
    attributes  = ["azurerm_resource_group"]
    label_order = ["name", "namespace", "environment", "stage", "location", "tenant"]
  }
  validation {
    condition     = contains(["rg"], var.resource_group_label["name"])
    error_message = <<EOM
    Resource group label name values cannot be defined.
    EOM
  }
  validation {
    condition     = contains(["azurerm_resource_group"], element(var.resource_group_label["attributes"], 0))
    error_message = <<EOM
    Resource group label attributes values cannot be defined.
    EOM
  }
}
### [END] variables.tf ###

