variable "profiles" {
  description = <<EOT
Map of profiles, attributes below
Required:
    - app_container_id
    - expiration_duration
    - name
Optional:
    - allow_impersonation
    - app_name
    - description
    - destination_url
    - disabled
    - extendable
    - extension_duration
    - extension_limit
    - notification_prior_to_expiration
    - associations (block):
        - parent_name (optional)
        - type (required)
        - value (required)
    - tag_associations (block):
        - key (required)
        - values (required)
EOT

  type = map(object({
    app_container_id                 = string
    expiration_duration              = string
    name                             = string
    allow_impersonation              = optional(bool)
    app_name                         = optional(string)
    description                      = optional(string)
    destination_url                  = optional(string)
    disabled                         = optional(bool)
    extendable                       = optional(bool)
    extension_duration               = optional(string)
    extension_limit                  = optional(number)
    notification_prior_to_expiration = optional(string)
    associations = optional(list(object({
      parent_name = optional(string)
      type        = string
      value       = string
    })))
    tag_associations = optional(list(object({
      key    = string
      values = list(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.profiles : (
        length(v.app_container_id) >= 1
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.profiles : (
        length(v.name) >= 1
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.profiles : (
        v.associations == null || alltrue([for item in v.associations : (contains(["Environment", "EnvironmentGroup", "ApplicationResource"], item.type))])
      )
    ])
    error_message = "must be one of: \"Environment\", \"EnvironmentGroup\", \"ApplicationResource\""
  }
  validation {
    condition = alltrue([
      for k, v in var.profiles : (
        v.associations == null || alltrue([for item in v.associations : (length(item.value) >= 1)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.profiles : (
        v.tag_associations == null || alltrue([for item in v.tag_associations : (length(item.key) >= 1)])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

