### [BEGIN] main.tf ###
module "label" {
  source          = "github.com/D3V0PSPL38/terraform-context-label.git"
  enabled         = module.this.enabled
  name            = var.name
  namespace       = var.namespace
  environment     = var.environment
  stage           = var.stage
  location        = var.location
  label_order     = var.label_order
  id_length_limit = var.id_length_limit
  tags            = var.tags
  context         = module.this.context
}
resource "azurerm_virtual_network" "this" {
  count               = local.e ? 1 : 0
  name                = format("%s-%02d", module.label.id, count.index + 1)
  location            = var.location
  resource_group_name = var.create_resource_group == true ? module.resource_group.this[0].name : var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  dynamic "subnet" {
    for_each = local.e == true ? [1] : []
    content {
      name           = format("%s-%02d", module.label.id, count.index + 1)
      address_prefix = [for i in var.address_prefixes : index(var.address_prefixes, i)]
      security_group = [for s in var.security_groups : index(var.security_groups, s)]
    }
  }
  tags = module.label.tags
}

module "resource_group" {
  source          = "github.com/D3V0PSPL38/terraform-azurerm-resource-group.git"
  enabled         = var.create_resource_group
  name            = var.name
  namespace       = var.namespace
  attributes      = var.attributes
  label_order     = var.label_order
  id_length_limit = var.id_length_limit
  environment     = var.environment
  stage           = var.stage
  location        = var.location
  tags            = var.tags
  context         = module.this.context
}
### [END] main.tf ###
