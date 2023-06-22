### [BEGIN] override.tf ###
module "resource_group" {
  source          = "github.com/D3V0PSPL38/terraform-azurerm-resource-group.git"
  count           = var.create_resource_group ? 1 : 0
  enabled         = module.this.enabled
  name            = join("-", [var.resource_group_label.name, var.name])
  namespace       = var.namespace
  attributes      = var.resource_group_label.attributes
  label_order     = var.resource_group_label.label_order
  id_length_limit = var.id_length_limit
  environment     = var.environment
  stage           = var.stage
  location        = var.location
  tags            = var.tags
  context         = module.this.context
}
### [END] override.tf ###