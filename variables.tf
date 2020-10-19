# Organization Variables
variable create_org {
  type        = bool
  default     = false
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
  description = "This variable controls if Organizations Accounts will be created or not"
}

variable organizations_accounts {
  type = list(object({
    name      = string
    email     = string
    parent_id = string
    role_name = string
  }))
  default = [
    {
      name      = "my_ou",
      email     = "my@myorg.com",
      parent_id = "parent_id",
      role_name = ""
    }
  ]
  description = "Organizations Accounts"
}

# Organizations Policy
variable create_organizations_policies {
  type        = bool
  default     = false
  description = "This variable controls if Organizations Policies will be created or not"
}

variable organizations_policy {
  type = list(object({
    name        = string
    description = string
    type        = string
    content     = string
  }))
  default = [
    {
      name        = "my_policy",
      description = "this is my policy",
      type        = "SERVICE_CONTROL_POLICY",
      content     = <<CONTENT
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "*",
    "Resource": "*"
  }
}
CONTENT
    }
  ]
  description = "Organizations Policies"
}


variable "policy_id" {
  default     = ""
  description = "The unique identifier (ID) of the policy that you want to attach to the target"
}

variable "target_id" {
  type        = any
  default     = []
  description = "The unique identifier (ID) of the root, organizational unit, or account number that you want to attach the policy to"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = { "Name" = "" }
}
