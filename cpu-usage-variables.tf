variable "cpu_usage_enabled" {
  type    = bool
  default = true
}

variable "cpu_usage_warning" {
  type    = number
  default = 70
}

variable "cpu_usage_critical" {
  type    = number
  default = 85
}

variable "cpu_usage_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "cpu_usage_note" {
  type    = string
  default = ""
}

variable "cpu_usage_docs" {
  type    = string
  default = ""
}

variable "cpu_usage_filter_override" {
  type    = string
  default = ""
}

variable "cpu_usage_alerting_enabled" {
  type    = bool
  default = true
}

variable "cpu_usage_no_data_timeframe" {
  type    = number
  default = null
}

variable "cpu_usage_notify_no_data" {
  type    = bool
  default = false
}

variable "cpu_usage_ok_threshold" {
  type    = number
  default = null
}

variable "cpu_usage_name_prefix" {
  type    = string
  default = ""
}

variable "cpu_usage_name_suffix" {
  type    = string
  default = ""
}

variable "cpu_usage_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}