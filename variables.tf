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
  type    = bool
  default = false
}