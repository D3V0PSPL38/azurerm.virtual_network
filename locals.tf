### [BEGIN] locals.tf ###
locals {
  enabled = module.this.enabled
  e       = local.enabled
  rg_label = {
    name       = try(join("-", [var.resource_group_label.name, var.name]), var.name)
    attributes = var.resource_group_label.attributes
  }
}
### [END] locals.tf ###
