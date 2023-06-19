### [BEGIN] locals.tf ###
locals {
  enabled = module.this.enabled
  e = local.enabled && (var.enable_default_subnet || var.enable_resource_group_per_resource)
}
### [END] locals.tf ###
