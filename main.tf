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
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  dynamic "subnet" {
    for_each = local.e ? [1] : []
    iterator = default
    content {
      name           = format("%s-%02d", module.label.id, subnet.key)
      address_prefix = var.address_prefix
      security_group = var.security_group
    }
  }
  tags = module.label.tags
}
### [END] main.tf ###
