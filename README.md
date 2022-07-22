
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Docker Container

This module is responsible for monitoring docker containers. This currently contains disk io, cpu, network, memory and threads

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator

# Example Usage

```terraform
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

```


[Module Variables](#module-variables)

Monitors:

| Monitor name    | Default enabled | Priority | Query                  |
|-----------------|------|----|------------------------|
| [CPU Usage](#cpu-usage) | True | 3  | `avg(last_15m):avg:docker.cpu.usage{tag:xxx} by {container_name,host${local.by_cluster}} > 85` |
| [Disk Io Read](#disk-io-read) | True | 3  | `avg(last_15m):avg:docker.io.read_bytes{tag:xxx} by {container_name,host${local.by_cluster}} > ` |
| [Disk Io Write](#disk-io-write) | True | 3  | `avg(last_15m):avg:docker.io.write_bytes{tag:xxx} by {container_name,host${local.by_cluster}} > ` |
| [Egress Traffic](#egress-traffic) | True | 3  | `avg(last_15m):avg:docker.net.bytes_sent{tag:xxx} by {container_name,host${local.by_cluster}} > ` |
| [Ingress Traffic](#ingress-traffic) | True | 3  | `avg(last_15m):avg:docker.net.bytes_rcvd{tag:xxx} by {container_name,host${local.by_cluster}} > ` |
| [Memory Used Percent](#memory-used-percent) | True | 3  | `avg(last_5m):avg:docker.mem.in_use{tag:xxx} by {container_name,host${local.by_cluster}} > 85` |
| [Thread Count](#thread-count) | False | 3  | `avg(last_30m):avg:docker.thread.count{tag:xxx} by {host${local.by_cluster},container_name} > ` |

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## CPU Usage

Query:
```terraform
avg(last_15m):avg:docker.cpu.usage{tag:xxx} by {container_name,host${local.by_cluster}} > 85
```

| variable                    | default  | required | description                      |
|-----------------------------|----------|----------|----------------------------------|
| cpu_usage_enabled           | True     | No       |                                  |
| cpu_usage_warning           | 70       | No       |                                  |
| cpu_usage_critical          | 85       | No       |                                  |
| cpu_usage_evaluation_period | last_15m | No       |                                  |
| cpu_usage_note              | ""       | No       |                                  |
| cpu_usage_docs              | ""       | No       |                                  |
| cpu_usage_filter_override   | ""       | No       |                                  |
| cpu_usage_alerting_enabled  | True     | No       |                                  |
| cpu_usage_no_data_timeframe | None     | No       |                                  |
| cpu_usage_notify_no_data    | False    | No       |                                  |
| cpu_usage_ok_threshold      | None     | No       |                                  |
| cpu_usage_name_prefix       | ""       | No       |                                  |
| cpu_usage_name_suffix       | ""       | No       |                                  |
| cpu_usage_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Disk Io Read

Query:
```terraform
avg(last_15m):avg:docker.io.read_bytes{tag:xxx} by {container_name,host${local.by_cluster}} > 
```

| variable                       | default  | required | description                      |
|--------------------------------|----------|----------|----------------------------------|
| disk_io_read_enabled           | True     | No       |                                  |
| disk_io_read_warning           | None     | No       |                                  |
| disk_io_read_critical          |          | Yes      |                                  |
| disk_io_read_evaluation_period | last_15m | No       |                                  |
| disk_io_read_note              | ""       | No       |                                  |
| disk_io_read_docs              | ""       | No       |                                  |
| disk_io_read_filter_override   | ""       | No       |                                  |
| disk_io_read_alerting_enabled  | True     | No       |                                  |
| disk_io_read_no_data_timeframe | None     | No       |                                  |
| disk_io_read_notify_no_data    | False    | No       |                                  |
| disk_io_read_ok_threshold      | None     | No       |                                  |
| disk_io_read_name_prefix       | ""       | No       |                                  |
| disk_io_read_name_suffix       | ""       | No       |                                  |
| disk_io_read_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Disk Io Write

Query:
```terraform
avg(last_15m):avg:docker.io.write_bytes{tag:xxx} by {container_name,host${local.by_cluster}} > 
```

| variable                        | default  | required | description                      |
|---------------------------------|----------|----------|----------------------------------|
| disk_io_write_enabled           | True     | No       |                                  |
| disk_io_write_warning           | None     | No       |                                  |
| disk_io_write_critical          |          | Yes      |                                  |
| disk_io_write_evaluation_period | last_15m | No       |                                  |
| disk_io_write_note              | ""       | No       |                                  |
| disk_io_write_docs              | ""       | No       |                                  |
| disk_io_write_filter_override   | ""       | No       |                                  |
| disk_io_write_alerting_enabled  | True     | No       |                                  |
| disk_io_write_no_data_timeframe | None     | No       |                                  |
| disk_io_write_notify_no_data    | False    | No       |                                  |
| disk_io_write_ok_threshold      | None     | No       |                                  |
| disk_io_write_name_prefix       | ""       | No       |                                  |
| disk_io_write_name_suffix       | ""       | No       |                                  |
| disk_io_write_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Egress Traffic

Query:
```terraform
avg(last_15m):avg:docker.net.bytes_sent{tag:xxx} by {container_name,host${local.by_cluster}} > 
```

| variable                         | default  | required | description                      |
|----------------------------------|----------|----------|----------------------------------|
| egress_traffic_enabled           | True     | No       |                                  |
| egress_traffic_warning           | None     | No       |                                  |
| egress_traffic_critical          |          | Yes      |                                  |
| egress_traffic_evaluation_period | last_15m | No       |                                  |
| egress_traffic_note              | ""       | No       |                                  |
| egress_traffic_docs              | ""       | No       |                                  |
| egress_traffic_filter_override   | ""       | No       |                                  |
| egress_traffic_alerting_enabled  | True     | No       |                                  |
| egress_traffic_no_data_timeframe | None     | No       |                                  |
| egress_traffic_notify_no_data    | False    | No       |                                  |
| egress_traffic_ok_threshold      | None     | No       |                                  |
| egress_traffic_name_prefix       | ""       | No       |                                  |
| egress_traffic_name_suffix       | ""       | No       |                                  |
| egress_traffic_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Ingress Traffic

Query:
```terraform
avg(last_15m):avg:docker.net.bytes_rcvd{tag:xxx} by {container_name,host${local.by_cluster}} > 
```

| variable                          | default  | required | description                      |
|-----------------------------------|----------|----------|----------------------------------|
| ingress_traffic_enabled           | True     | No       |                                  |
| ingress_traffic_warning           | None     | No       |                                  |
| ingress_traffic_critical          |          | Yes      |                                  |
| ingress_traffic_evaluation_period | last_15m | No       |                                  |
| ingress_traffic_note              | ""       | No       |                                  |
| ingress_traffic_docs              | ""       | No       |                                  |
| ingress_traffic_filter_override   | ""       | No       |                                  |
| ingress_traffic_alerting_enabled  | True     | No       |                                  |
| ingress_traffic_no_data_timeframe | None     | No       |                                  |
| ingress_traffic_notify_no_data    | False    | No       |                                  |
| ingress_traffic_ok_threshold      | None     | No       |                                  |
| ingress_traffic_name_prefix       | ""       | No       |                                  |
| ingress_traffic_name_suffix       | ""       | No       |                                  |
| ingress_traffic_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Memory Used Percent

Query:
```terraform
avg(last_5m):avg:docker.mem.in_use{tag:xxx} by {container_name,host${local.by_cluster}} > 85
```

| variable                              | default  | required | description                      |
|---------------------------------------|----------|----------|----------------------------------|
| memory_used_percent_enabled           | True     | No       |                                  |
| memory_used_percent_warning           | 70       | No       |                                  |
| memory_used_percent_critical          | 85       | No       |                                  |
| memory_used_percent_evaluation_period | last_5m  | No       |                                  |
| memory_used_percent_note              | ""       | No       |                                  |
| memory_used_percent_docs              | ""       | No       |                                  |
| memory_used_percent_filter_override   | ""       | No       |                                  |
| memory_used_percent_alerting_enabled  | True     | No       |                                  |
| memory_used_percent_no_data_timeframe | None     | No       |                                  |
| memory_used_percent_notify_no_data    | False    | No       |                                  |
| memory_used_percent_ok_threshold      | None     | No       |                                  |
| memory_used_percent_name_prefix       | ""       | No       |                                  |
| memory_used_percent_name_suffix       | ""       | No       |                                  |
| memory_used_percent_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Thread Count

Query:
```terraform
avg(last_30m):avg:docker.thread.count{tag:xxx} by {host${local.by_cluster},container_name} > 
```

| variable                       | default  | required | description                      |
|--------------------------------|----------|----------|----------------------------------|
| thread_count_enabled           | False    | No       |                                  |
| thread_count_warning           | None     | No       |                                  |
| thread_count_critical          | None     | No       |                                  |
| thread_count_evaluation_period | last_30m | No       |                                  |
| thread_count_note              | ""       | No       |                                  |
| thread_count_docs              | ""       | No       |                                  |
| thread_count_filter_override   | ""       | No       |                                  |
| thread_count_alerting_enabled  | True     | No       |                                  |
| thread_count_no_data_timeframe | None     | No       |                                  |
| thread_count_notify_no_data    | False    | No       |                                  |
| thread_count_ok_threshold      | None     | No       |                                  |
| thread_count_name_prefix       | ""       | No       |                                  |
| thread_count_name_suffix       | ""       | No       |                                  |
| thread_count_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable             | default  | required | description                                              |
|----------------------|----------|----------|----------------------------------------------------------|
| filter_str           |          | Yes      |                                                          |
| env                  |          | Yes      |                                                          |
| service              |          | Yes      |                                                          |
| notification_channel |          | Yes      |                                                          |
| additional_tags      | []       | No       |                                                          |
| locked               | False    | No       |                                                          |
| name_prefix          | ""       | No       |                                                          |
| name_suffix          | ""       | No       |                                                          |
| runs_in_k8s          | False    | No       |                                                          |
| priority_offset      | 0        | No       | For non production workloads we can +1 on the priorities |


