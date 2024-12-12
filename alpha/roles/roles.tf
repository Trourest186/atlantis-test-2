locals {
  project_id = "tiliter-alpha"
}

# Created manually and imported into terraform state
# Too risky to let atlantis create

module "alpha_admin_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_alpha_admin_custom_role"
  description = "The custom role for admin groups in alpha"
  title       = "tiliter_alpha_admin_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

module "alpha_dev_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_alpha_dev_custom_role"
  description = "The custom role for dev groups in alpha"
  title       = "tiliter_alpha_dev_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

module "alpha_read_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_alpha_read_custom_role"
  description = "The custom role for read groups in alpha"
  title       = "tiliter_alpha_read_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

output "admin_custom_role" {
  value = module.alpha_admin_custom_roles.custome_role.role_id
}

output "dev_custom_role" {
  value = module.alpha_dev_custom_roles.custome_role.role_id
}

output "read_custom_role" {
  value = module.alpha_read_custom_roles.custome_role.role_id
}