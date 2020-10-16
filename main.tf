data "aws_caller_identity" "current" {}

locals {
  # Get distinct OUs names and parents
  #distinct_ou_names  = distinct(var.organizational_units.*.ou_name)
  #distinct_ou_parent = distinct(var.organizational_units.*.parent_ou_name)

  # Get distinct Accounts names and parents
  #distinct_accounts = distinct(var.accounts)

}


################
# Organization #
################
resource "aws_organizations_organization" "this" {

  count = var.create_org ? 1 : 0

  aws_service_access_principals = var.aws_service_access_principals
  enabled_policy_types          = var.enabled_policy_types
  feature_set                   = var.feature_set

}

########################
# Organizational Units #
########################
resource "aws_organizations_organizational_unit" "this" {

  for_each = var.create_organizational_units ? { for ou in var.organizational_units : ou.name => ou } : {}

  name      = each.value.name
  parent_id = length(each.value.parent_id) > 0 ? each.value.parent_id : aws_organizations_organization.this[0].roots[0].id

}

############################
#  Organizations Accounts  #
############################
resource "aws_organizations_account" "this" {

  for_each = var.create_organizations_accounts ? { for acc in var.organizations_accounts : acc.name => acc } : {}
  name     = each.value.name
  email    = each.value.email
}


