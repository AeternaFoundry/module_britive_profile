output "profiles_id" {
  description = "Map of id values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.id }
}
output "profiles_allow_impersonation" {
  description = "Map of allow_impersonation values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.allow_impersonation }
}
output "profiles_app_container_id" {
  description = "Map of app_container_id values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.app_container_id }
}
output "profiles_app_name" {
  description = "Map of app_name values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.app_name }
}
output "profiles_associations" {
  description = "Map of associations values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.associations }
}
output "profiles_description" {
  description = "Map of description values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.description }
}
output "profiles_destination_url" {
  description = "Map of destination_url values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.destination_url }
}
output "profiles_disabled" {
  description = "Map of disabled values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.disabled }
}
output "profiles_expiration_duration" {
  description = "Map of expiration_duration values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.expiration_duration }
}
output "profiles_extendable" {
  description = "Map of extendable values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.extendable }
}
output "profiles_extension_duration" {
  description = "Map of extension_duration values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.extension_duration }
}
output "profiles_extension_limit" {
  description = "Map of extension_limit values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.extension_limit }
}
output "profiles_name" {
  description = "Map of name values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.name }
}
output "profiles_notification_prior_to_expiration" {
  description = "Map of notification_prior_to_expiration values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.notification_prior_to_expiration }
}
output "profiles_tag_associations" {
  description = "Map of tag_associations values across all profiles, keyed the same as var.profiles"
  value       = { for k, v in britive_profile.profiles : k => v.tag_associations }
}

