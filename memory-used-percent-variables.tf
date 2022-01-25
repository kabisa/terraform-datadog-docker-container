variable "memory_used_percent_enabled" {
  type    = bool
  default = true
}

variable "memory_used_percent_warning" {
  type    = number
  default = 70
}

variable "memory_used_percent_critical" {
  type    = number
  default = 85
}

variable "memory_used_percent_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_used_percent_note" {
  type    = string
  default = ""
}

variable "memory_used_percent_docs" {
  type    = string
  default = ""
}

variable "memory_used_percent_filter_override" {
  type    = string
  default = ""
}

variable "memory_used_percent_alerting_enabled" {
  type    = bool
  default = true
}

variable "memory_used_percent_no_data_timeframe" {
  type    = number
  default = null
}

variable "memory_used_percent_notify_no_data" {
  type    = bool
  default = false
}

variable "memory_used_percent_ok_threshold" {
  type    = number
  default = null
}

variable "memory_used_percent_name_prefix" {
  type    = string
  default = ""
}

variable "memory_used_percent_name_suffix" {
  type    = string
  default = ""
}

variable "memory_used_percent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}