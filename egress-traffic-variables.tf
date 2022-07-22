variable "egress_traffic_enabled" {
  type    = bool
  default = true
}

variable "egress_traffic_warning" {
  type    = number
  default = null
}

variable "egress_traffic_critical" {
  type = number
}

variable "egress_traffic_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "egress_traffic_note" {
  type    = string
  default = ""
}

variable "egress_traffic_docs" {
  type    = string
  default = ""
}

variable "egress_traffic_filter_override" {
  type    = string
  default = ""
}

variable "egress_traffic_alerting_enabled" {
  type    = bool
  default = true
}

variable "egress_traffic_no_data_timeframe" {
  type    = number
  default = null
}

variable "egress_traffic_notify_no_data" {
  type    = bool
  default = false
}

variable "egress_traffic_ok_threshold" {
  type    = number
  default = null
}

variable "egress_traffic_name_prefix" {
  type    = string
  default = ""
}

variable "egress_traffic_name_suffix" {
  type    = string
  default = ""
}

variable "egress_traffic_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
