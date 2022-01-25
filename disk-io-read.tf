locals {
  disk_io_read_filter = coalesce(
    var.disk_io_read_filter_override,
    var.filter_str
  )
}

module "disk_io_read" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name  = "Container - Disk IO Read"
  query = "avg(${var.disk_io_read_evaluation_period}):avg:docker.io.read_bytes{${local.disk_io_read_filter}} by {container_name,host${local.by_cluster}} > ${var.disk_io_read_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Container - Disk IO Read ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Container - Disk IO Read ({{ value }}) in {{ service }} has recovered"
  custom_message      = "${local.on_cluster}Host:{{host.name}} Container:{{container_name.name}}"

  # monitor level vars
  enabled            = var.disk_io_read_enabled
  alerting_enabled   = var.disk_io_read_alerting_enabled
  warning_threshold  = var.disk_io_read_warning
  critical_threshold = var.disk_io_read_critical
  priority           = var.disk_io_read_priority
  docs               = var.disk_io_read_docs
  note               = var.disk_io_read_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
