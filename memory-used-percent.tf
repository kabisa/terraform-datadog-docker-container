locals {
  memory_used_percent_filter = coalesce(
    var.memory_used_percent_filter_override,
    var.filter_str
  )
}

module "memory_used_percent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name  = "Container - Memory usage"
  query = "avg(${var.memory_used_percent_evaluation_period}):avg:docker.mem.in_use{${local.memory_used_percent_filter}} by {container_name,host${local.by_cluster}} > ${var.memory_used_percent_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Container - Memory usage ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Container - Memory usage ({{ value }}) in {{ service }} has recovered"
  custom_message      = "${local.on_cluster}Host:{{host.name}} Container:{{container_name.name}}"

  # monitor level vars
  enabled            = var.memory_used_percent_enabled
  alerting_enabled   = var.memory_used_percent_alerting_enabled
  warning_threshold  = var.memory_used_percent_warning
  critical_threshold = var.memory_used_percent_critical
  priority           = var.memory_used_percent_priority
  docs               = var.memory_used_percent_docs
  note               = var.memory_used_percent_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
