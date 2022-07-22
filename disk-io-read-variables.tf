variable "disk_io_read_enabled" {
  type    = bool
  default = true
}

variable "disk_io_read_warning" {
  type    = number
  default = null
}

variable "disk_io_read_critical" {
  type = number
}

variable "disk_io_read_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "disk_io_read_note" {
  type    = string
  default = ""
}

variable "disk_io_read_docs" {
  type    = string
  default = ""
}

variable "disk_io_read_filter_override" {
  type    = string
  default = ""
}

variable "disk_io_read_alerting_enabled" {
  type    = bool
  default = true
}

variable "disk_io_read_no_data_timeframe" {
  type    = number
  default = null
}

variable "disk_io_read_notify_no_data" {
  type    = bool
  default = false
}

variable "disk_io_read_ok_threshold" {
  type    = number
  default = null
}

variable "disk_io_read_name_prefix" {
  type    = string
  default = ""
}

variable "disk_io_read_name_suffix" {
  type    = string
  default = ""
}

variable "disk_io_read_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
