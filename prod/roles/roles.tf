locals {
  project_id = "dev-sota-data-platform"
}

# Created manually and imported into terraform state
# Too risky to let atlantis create

module "prod_admin_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_prod_admin_custom_role"
  description = "The custom role for admin groups in production"
  title       = "tiliter_prod_admin_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin"
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

module "prod_dev_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_prod_dev_custom_role"
  description = "The custom role for dev groups in production"
  title       = "tiliter_prod_dev_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

module "prod_read_custom_role" {
  source      = "../../modules/roles"
  project     = local.project_id
  role_id     = "tiliter_prod_read_custom_role"
  description = "The custom role for read groups in production"
  title       = "tiliter_prod_read_custom_role"
  predefined_roles = [
    "roles/compute.instanceAdmin",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
}

output "admin_custom_role" {
  value = module.prod_admin_custom_role.custome_role.role_id
}

output "dev_custom_role" {
  value = module.prod_dev_custom_role.custome_role.role_id
}

output "read_custom_role" {
  value = module.prod_read_custom_role.custome_role.role_id
}