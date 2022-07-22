locals {
  memory_used_percent_filter = coalesce(
    var.memory_used_percent_filter_override,
    var.filter_str
  )
}

module "memory_used_percent" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

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
  priority           = min(var.memory_used_percent_priority + var.priority_offset, 5)
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
