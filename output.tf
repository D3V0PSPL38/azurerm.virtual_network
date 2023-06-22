### [BEGIN] output.tf ###
output "name" {
  description = <<EOD
  [Output] The name of the virtual network.
  EOD
  value       = join("", azurerm_virtual_network.this.*.name)
}

output "id" {
  description = <<EOD
  [Output] The ID of the virtual network.
  EOD
  value       = join("", azurerm_virtual_network.this.*.id)
}

output "location" {
  description = <<EOD
  [Output] Location of the virtual network.
  EOD
  value       = join("", azurerm_virtual_network.this.*.location)
}

output "address_space" {
  description = <<EOD
  [Output] The list of address spaces used by the virtual network.
  EOD
  value       = concat(azurerm_virtual_network.this.*.address_space)
}

output "dns_servers" {
  description = <<EOD
  [Output] The list of DNS servers used by the virtual network.
  EOD
  value       = concat(azurerm_virtual_network.this.*.dns_servers)
}

output "guid" {
  description = <<EOD
  [Output] The GUID of the virtual network.
  EOD
  value       = join("", azurerm_virtual_network.this.*.guid)
}

output "subnets" {
  description = <<EOD
  [Output] The list of name of the subnets that are attached to this virtual network.
  EOD
  value       = concat(azurerm_virtual_network.this.*.subnets)
}

output "vnet_peerings" {
  description = <<EOD
  [Output] A mapping of name - virtual network id of the virtual network peerings.
  EOD
  value       = join("", azurerm_virtual_network.this.*.vnet_peerings)
}

output "vnet_peerings_addresses" {
  description = <<EOD
  [Output] A list of virtual network peerings IP addresses.
  EOD
  value       = join("", azurerm_virtual_network.this.*.vnet_peerings_addresses)
}

output "tags" {
  description = <<EOD
  [Optional] A mapping of tags to assigned to the resource.
  EOD
  value       = join("", azurerm_virtual_network.this.*.tags)
}
### [END] output.tf ###