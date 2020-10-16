terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

variable "aws_region" {
  default = "us-east-1"
}

variable create_org {
  type        = bool
  default     = true
  description = "This variable controls if Organization will be created or not"
}

variable aws_service_access_principals {
  type        = list
  default     = []
  description = "description"
}

variable enabled_policy_types {
  type        = list
  default     = []
  description = "List of Organizations Policy Types to enable in the Organization Root"
}

variable feature_set {
  type        = string
  default     = "ALL"
  description = ""
}

variable create_organizational_units {
  type        = bool
  default     = true
  description = "This variable controls if Organization will be created or not"
}

variable create_organizations_accounts {
  type        = bool
  default     = true
  description = "This variable controls if Organizations Organizational unit will be created or not"
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
}

module "my-org" {
  source = "../../../terraform-aws-organizations"

  # My Org
  create_org                    = var.create_org
  aws_service_access_principals = var.aws_service_access_principals
  enabled_policy_types          = var.enabled_policy_types
  feature_set                   = var.feature_set

  # My Org OUs
  create_organizational_units = var.create_organizational_units
  organizational_units = [
    {
      name      = "my_ou",
      parent_id = "r-5hew"
    }
  ]

  # My Org Accounts
  create_organizations_accounts = var.create_organizations_accounts
  organizations_accounts = [
    {
      name      = "my_ou",
      email     = "my@dcab.com",
      parent_id = "",
      role_name = "MyRoleHere"
    },
    {
      name      = "my_ou2",
      email     = "my2@dcab.com",
      parent_id = "",
      role_name = ""
    },
  ]
}

