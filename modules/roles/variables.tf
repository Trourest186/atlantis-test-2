# # modules/google_project_iam_binding/variables.tf
# variable "project_id" {
#   description = "The ID of the project to which the IAM roles will be assigned."
#   type        = string
# }

# variable "user_email" {
#   description = "The email of the user to whom the roles will be assigned."
#   type        = string
# }

# variable "roles" {
#   description = "List of roles to assign to the user."
#   type        = list(string)
#   default     = []
# }


variable "role_id" {
  type = string
}

variable "title" {
  type = string
}

variable "description" {
  type = string
}

variable "project" {
  type = string
}

variable "predefined_roles" {
  type = list(string)
}

variable "additional_permissions" {
  type    = list(string)
  default = []

}

variable "excluded_permissions" {
  type    = list(string)
  default = []
}