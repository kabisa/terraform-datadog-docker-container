# tflint-ignore: terraform_module_version
module "containers" {
  source = "kabisa/docker-container/datadog"

  notification_channel = "@mail@example.com"
  service              = "MyApp"
  env                  = "prd"
  filter_str           = "app:myapp"

  # example parameters, you can also disable the monitors
  disk_io_read_warning     = 7500000  # 7.5MB/s
  disk_io_read_critical    = 10000000 # 10MB/s
  disk_io_write_warning    = 7500000  # 7.5MB/s
  disk_io_write_critical   = 10000000 # 10MB/s
  egress_traffic_warning   = 7500000  # 7.5MB/s
  egress_traffic_critical  = 10000000 # 10MB/s
  ingress_traffic_warning  = 7500000  # 7.5MB/s
  ingress_traffic_critical = 10000000 # 10MB/s
}
