locals {
  project_id = "tiliter-beta"
}

# Created manually and imported into terraform state
# Too risky to let atlantis create

module "beta_admin_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_beta_admin_custom_role"
  description = "The custom role for admin groups in beta"
  title       = "tiliter_beta_admin_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

module "beta_dev_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_beta_dev_custom_role"
  description = "The custom role for dev groups in beta"
  title       = "tiliter_beta_dev_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

module "beta_read_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_beta_read_custom_role"
  description = "The custom role for read groups in beta"
  title       = "tiliter_beta_read_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

output "admin_custom_role" {
  value = module.beta_admin_custom_roles.custome_role.role_id
}

output "dev_custom_role" {
  value = module.beta_dev_custom_roles.custome_role.role_id
}

output "read_custom_role" {
  value = module.beta_read_custom_roles.custome_role.role_id
}