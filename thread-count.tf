locals {
  thread_count_filter = coalesce(
    var.thread_count_filter_override,
    var.filter_str
  )
}

module "thread_count" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Container - Thread Count"
  query = "avg(${var.thread_count_evaluation_period}):avg:docker.thread.count{${local.thread_count_filter}} by {host${local.by_cluster},container_name} > ${var.thread_count_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Container - Thread Count ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Container - Thread Count ({{ value }}) in {{ service }} has recovered"
  custom_message      = "${local.on_cluster}Host:{{host.name}} Container:{{container_name.name}}"

  # monitor level vars
  enabled            = var.thread_count_enabled
  alerting_enabled   = var.thread_count_alerting_enabled
  warning_threshold  = var.thread_count_warning
  critical_threshold = var.thread_count_critical
  priority           = min(var.thread_count_priority + var.priority_offset, 5)
  docs               = var.thread_count_docs
  note               = var.thread_count_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
