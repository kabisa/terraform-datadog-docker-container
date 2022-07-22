locals {
  egress_traffic_filter = coalesce(
    var.egress_traffic_filter_override,
    var.filter_str
  )
}

module "egress_traffic" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Container - Egress Traffic"
  query = "avg(${var.egress_traffic_evaluation_period}):avg:docker.net.bytes_sent{${local.egress_traffic_filter}} by {container_name,host${local.by_cluster}} > ${var.egress_traffic_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Container - Egress Traffic ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Container - Egress Traffic ({{ value }}) in {{ service }} has recovered"
  custom_message      = "${local.on_cluster}Host:{{host.name}} Container:{{container_name.name}}"

  # monitor level vars
  enabled            = var.egress_traffic_enabled
  alerting_enabled   = var.egress_traffic_alerting_enabled
  warning_threshold  = var.egress_traffic_warning
  critical_threshold = var.egress_traffic_critical
  priority           = min(var.egress_traffic_priority + var.priority_offset, 5)
  docs               = var.egress_traffic_docs
  note               = var.egress_traffic_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
