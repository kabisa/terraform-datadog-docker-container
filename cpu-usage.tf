locals {
  cpu_usage_filter = coalesce(
    var.cpu_usage_filter_override,
    var.filter_str
  )
}

module "cpu_usage" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name  = "Container - CPU usage"
  query = "avg(${var.cpu_usage_evaluation_period}):avg:docker.cpu.usage{${local.cpu_usage_filter}} by {container_name,host${local.by_cluster}} > ${var.cpu_usage_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Container - CPU usage ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Container - CPU usage ({{ value }}) in {{ service }} has recovered"
  custom_message      = "${local.on_cluster}Host:{{host.name}} Container:{{container_name.name}}"

  # monitor level vars
  enabled            = var.cpu_usage_enabled
  alerting_enabled   = var.cpu_usage_alerting_enabled
  warning_threshold  = var.cpu_usage_warning
  critical_threshold = var.cpu_usage_critical
  priority           = var.cpu_usage_priority
  docs               = var.cpu_usage_docs
  note               = var.cpu_usage_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
