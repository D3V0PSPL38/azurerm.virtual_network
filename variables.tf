### [BEGIN] variables.tf ###
variable "resource_group_module" {
  description = <<EOD
  [Optional] Resource group module object definition.
  EOD
  type = object({
    enabled         = optional(bool)
    name            = optional(string)
    namespace       = optional(string)
    environment     = optional(string)
    attributes      = optional(list(string))
    stage           = optional(string)
    location        = optional(string)
    label_order     = optional(list(string))
    id_length_limit = optional(number)
    tags            = optional(map(string))
    context         = optional(map(string))
  })
  default = {
    enabled         = true
    name            = null
    namespace       = "rg"
    environment     = null
    attributes      = ["azurerm_resource_group"]
    stage           = null
    location        = null
    label_order     = ["name", "namespace", "environment", "stage", "location"]
    id_length_limit = 0
    tags            = {}
  }
}
variable "enable_resource_group_per_resource" {
  description = <<EOD
  [Optional] Set to `true` by default. Creates a resource group for each resource. If set to `false`, all resources will be created in the same resource group.
  EOD
  type        = bool
  default     = true
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
### [END] variables.tf ###

