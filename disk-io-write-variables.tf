variable "disk_io_write_enabled" {
  type    = bool
  default = true
}

variable "disk_io_write_warning" {
  type    = number
  default = null
}

variable "disk_io_write_critical" {
  type = number
}

variable "disk_io_write_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "disk_io_write_note" {
  type    = string
  default = ""
}

variable "disk_io_write_docs" {
  type    = string
  default = ""
}

variable "disk_io_write_filter_override" {
  type    = string
  default = ""
}

variable "disk_io_write_alerting_enabled" {
  type    = bool
  default = true
}

variable "disk_io_write_no_data_timeframe" {
  type    = number
  default = null
}

variable "disk_io_write_notify_no_data" {
  type    = bool
  default = false
}

variable "disk_io_write_ok_threshold" {
  type    = number
  default = null
}

variable "disk_io_write_name_prefix" {
  type    = string
  default = ""
}

variable "disk_io_write_name_suffix" {
  type    = string
  default = ""
}

variable "disk_io_write_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
