data "aws_caller_identity" "current" {}

locals {
  # Get distinct OUs names and parents
  distinct_ou_names  = distinct(var.organizational_units.*.ou_name)
  distinct_ou_parent = distinct(var.organizational_units.*.parent_ou_name)

  # Get distinct Accounts names and parents
  distinct_accounts = distinct(var.accounts)

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
  for_each = var.create_org && lenght(var.organizational_units) > 0 ? toset(var.organizational_units) : []

  name      = lookup(local.distinct_ou_names[index(local.distinct_ou_names, each.key)], "ou_name")
  parent_id = lookup(local.distinct_ou_names[index(local.distinct_ou_parent, each.key)], "parent_ou_name")

  # aws_organizations_organizational_unit.this.roots.0.id
}

############################
#  Organizations Accounts  #
############################
resource "aws_organizations_account" "this" {
  for_each = var.create_org && lenght(var.organizational_accounts) > 0 ? toset(var.organizational_accounts) : []

  name      = lookup(local.distinct_accounts[index(local.distinct_account_names, each.key)], "name")
  email     = lookup(local.distinct_accounts[index(local.distinct_account_names, each.key)], "email")
  parent_id = lookup(local.distinct_accounts[index(local.distinct_account_names, each.key)], "parent")
  #TODO: (dcaballero) add id here
}

