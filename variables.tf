variable "filter_str" {
  type = string
}

variable "env" {
  type = string
}

variable "service" {
  type = string
}

variable "notification_channel" {
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "locked" {
  type    = bool
  default = false
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "name_suffix" {
  type    = string
  default = ""
}

variable "runs_in_k8s" {
  description = "This will add extra group by cluster to alerts"
  type        = bool
  default     = false
}

variable "priority_offset" {
  description = "For non production workloads we can +1 on the priorities"
  default     = 0
}
