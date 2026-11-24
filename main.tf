resource "britive_profile" "profiles" {
  for_each = var.profiles

  app_container_id                 = each.value.app_container_id
  expiration_duration              = each.value.expiration_duration
  name                             = each.value.name
  allow_impersonation              = each.value.allow_impersonation
  app_name                         = each.value.app_name
  description                      = each.value.description
  destination_url                  = each.value.destination_url
  disabled                         = each.value.disabled
  extendable                       = each.value.extendable
  extension_duration               = each.value.extension_duration
  extension_limit                  = each.value.extension_limit
  notification_prior_to_expiration = each.value.notification_prior_to_expiration

  dynamic "associations" {
    for_each = each.value.associations != null ? each.value.associations : []
    content {
      parent_name = associations.value.parent_name
      type        = associations.value.type
      value       = associations.value.value
    }
  }

  dynamic "tag_associations" {
    for_each = each.value.tag_associations != null ? each.value.tag_associations : []
    content {
      key    = tag_associations.value.key
      values = tag_associations.value.values
    }
  }
}

