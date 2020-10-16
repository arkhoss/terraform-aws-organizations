# Organization Variables
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

# Organizational Units Variables
variable create_organizational_units {
  type        = bool
  default     = false
  description = "This variable controls if Organizations Organizational unit will be created or not"
}

variable organizational_units {
  type = list(object({
    name      = string
    parent_id = string
  }))
  default = [
    {
      name      = "my_ou",
      parent_id = "parent_id"
    }
  ]
  description = "Organizational Units"
}

# Organizations Accounts
variable create_organizations_accounts {
  type        = bool
  default     = false
  description = "This variable controls if Organizations Organizational unit will be created or not"
}

variable organizations_accounts {
  type = list(object({
    name  = string
    email = string
  }))
  default = [
    {
      name  = "my_ou",
      email = "my@myorg.com"
    }
  ]
  description = "Organizational Units"
}

