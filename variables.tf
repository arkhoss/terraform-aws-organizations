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

variable "policy_name" {
  default     = ""
  description = "The friendly name to assign to the policy"
}

variable "policy_description" {
  default     = ""
  description = "A description to assign to the policy"
}

variable "policy_type" {
  default     = "SERVICE_CONTROL_POLICY"
  description = "The type of policy to create. Currently, the only valid values are SERVICE_CONTROL_POLICY (SCP) and TAG_POLICY. Defaults to SERVICE_CONTROL_POLICY"
}

variable "policy_content" {
  description = "The policy content to add to the new policy. For example, if you create a [service control policy (SCP)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html), this string must be JSON text that specifies the permissions that admins in attached accounts can delegate to their users, groups, and roles. For more information about the SCP syntax, see the [Service Control Policy Syntax documentation](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_scp-syntax.html) and for more information on the Tag Policy syntax, see the [Tag Policy Syntax documentation.](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_example-tag-policies.html)"
  default     = <<CONTENT
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

variable "policy_id" {
  default     = ""
  description = "The unique identifier (ID) of the policy that you want to attach to the target"
}