#### GRANT USER ACCESS THE PRODUCTION FOLDERS ####
data "terraform_remote_state" "production" {
  backend = "gcs"
  config = {
    bucket = "sotabox-trourest"
    prefix = "gcp/management/prod/roles"
  }
}

# List of google group emails are granted the belows roles
variable "admin_group_email" {
  type    = set(string)
  default = ["giang.pham2@sotatek.com", "vinh.pham2@sotatek.com"]
}

variable "dev_group_email" {
  type    = set(string)
  default = ["dung136ptit@gmail.com"]
}

variable "read_group_email" {
  type    = set(string)
  default = ["hue@cloudaz.io"]
}

locals {
  roles = {
    admin = "projects/${local.project_id}/roles/${data.terraform_remote_state.production.outputs.admin_custom_role}"
    dev   = "projects/${local.project_id}/roles/${data.terraform_remote_state.production.outputs.dev_custom_role}"
    read  = "projects/${local.project_id}/roles/${data.terraform_remote_state.production.outputs.read_custom_role}"
  }
}

locals {
  admin_access_permissions = distinct(flatten([
    for email in var.admin_group_email : {
      email = email
      role  = local.roles.admin
    }
  ]))
  dev_access_permissions = distinct(flatten([
    for email in var.dev_group_email : {
      email = email
      role  = local.roles.dev
    }
  ]))
  read_access_permissions = distinct(flatten([
    for email in var.read_group_email : {
      email = email
      role  = local.roles.read
    }
  ]))
  access_permission_lists = flatten([
    local.admin_access_permissions,
    local.dev_access_permissions,
    local.read_access_permissions
  ])
}

# Bind roles to users
resource "google_project_iam_binding" "iam_binding" {
  for_each = { for perm in local.access_permission_lists : 
    "${perm.email}-${perm.role}" => perm
  }

  project = local.project_id
  role    = each.value.role

  members = [
    "user:${each.value.email}"
  ]
}
