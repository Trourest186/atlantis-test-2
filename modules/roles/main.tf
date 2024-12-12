data "google_iam_role" "role_info" {
  for_each = toset(var.predefined_roles)
  name     = each.value
}

locals {
  role_permissions = concat(flatten(values(data.google_iam_role.role_info)[*].included_permissions), var.additional_permissions)
  permissions = [
    for permission in local.role_permissions :
    permission if !contains(var.excluded_permissions, permission)
  ]
}

resource "google_project_iam_custom_role" "prod_role_groups" {
  role_id     = var.role_id
  title       = var.title
  description = var.description
  permissions = local.permissions
  project     = var.project
}

output "custome_role" {
  value = google_project_iam_custom_role.prod_role_groups
}
