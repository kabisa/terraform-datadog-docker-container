variable "thread_count_enabled" {
  type    = bool
  default = false
}

variable "thread_count_warning" {
  type    = number
  default = null
}

variable "thread_count_critical" {
  type    = number
  default = null
}

variable "thread_count_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "thread_count_note" {
  type    = string
  default = ""
}

variable "thread_count_docs" {
  type    = string
  default = ""
}

variable "thread_count_filter_override" {
  type    = string
  default = ""
}

variable "thread_count_alerting_enabled" {
  type    = bool
  default = true
}

variable "thread_count_no_data_timeframe" {
  type    = number
  default = null
}

variable "thread_count_notify_no_data" {
  type    = bool
  default = false
}

variable "thread_count_ok_threshold" {
  type    = number
  default = null
}

variable "thread_count_name_prefix" {
  type    = string
  default = ""
}

variable "thread_count_name_suffix" {
  type    = string
  default = ""
}

variable "thread_count_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
