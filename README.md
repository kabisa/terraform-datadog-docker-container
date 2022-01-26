
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit)

# Terraform module for Datadog Docker Container

Monitors:
* [Terraform module for Datadog Docker Container](#terraform-module-for-datadog-docker-container)
  * [CPU Usage](#cpu-usage)
  * [Thread Count](#thread-count)
  * [Disk Io Write](#disk-io-write)
  * [Ingress Traffic](#ingress-traffic)
  * [Memory Used Percent](#memory-used-percent)
  * [Egress Traffic](#egress-traffic)
  * [Disk Io Read](#disk-io-read)
  * [Module Variables](#module-variables)

# Getting started
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you cloud a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## CPU Usage

Query:
```terraform
avg(${var.cpu_usage_evaluation_period}):avg:docker.cpu.usage{${local.cpu_usage_filter}} by {container_name,host${local.by_cluster}} > ${var.cpu_usage_critical}
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
| cpu_usage_no_data_timeframe | null     | No       |                                  |
| cpu_usage_notify_no_data    | False    | No       |                                  |
| cpu_usage_ok_threshold      | null     | No       |                                  |
| cpu_usage_name_prefix       | ""       | No       |                                  |
| cpu_usage_name_suffix       | ""       | No       |                                  |
| cpu_usage_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Thread Count

Query:
```terraform
avg(${var.thread_count_evaluation_period}):avg:docker.thread.count{${local.thread_count_filter}} by {host${local.by_cluster},container_name} > ${var.thread_count_critical}
```

| variable                       | default  | required | description                      |
|--------------------------------|----------|----------|----------------------------------|
| thread_count_enabled           | False    | No       |                                  |
| thread_count_warning           | null     | No       |                                  |
| thread_count_critical          | null     | No       |                                  |
| thread_count_evaluation_period | last_30m | No       |                                  |
| thread_count_note              | ""       | No       |                                  |
| thread_count_docs              | ""       | No       |                                  |
| thread_count_filter_override   | ""       | No       |                                  |
| thread_count_alerting_enabled  | True     | No       |                                  |
| thread_count_no_data_timeframe | null     | No       |                                  |
| thread_count_notify_no_data    | False    | No       |                                  |
| thread_count_ok_threshold      | null     | No       |                                  |
| thread_count_name_prefix       | ""       | No       |                                  |
| thread_count_name_suffix       | ""       | No       |                                  |
| thread_count_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Disk Io Write

Query:
```terraform
avg(${var.disk_io_write_evaluation_period}):avg:docker.io.write_bytes{${local.disk_io_write_filter}} by {container_name,host${local.by_cluster}} > ${var.disk_io_write_critical}
```

| variable                        | default  | required | description                      |
|---------------------------------|----------|----------|----------------------------------|
| disk_io_write_enabled           | True     | No       |                                  |
| disk_io_write_warning           | null     | No       |                                  |
| disk_io_write_critical          |          | Yes      |                                  |
| disk_io_write_evaluation_period | last_15m | No       |                                  |
| disk_io_write_note              | ""       | No       |                                  |
| disk_io_write_docs              | ""       | No       |                                  |
| disk_io_write_filter_override   | ""       | No       |                                  |
| disk_io_write_alerting_enabled  | True     | No       |                                  |
| disk_io_write_no_data_timeframe | null     | No       |                                  |
| disk_io_write_notify_no_data    | False    | No       |                                  |
| disk_io_write_ok_threshold      | null     | No       |                                  |
| disk_io_write_name_prefix       | ""       | No       |                                  |
| disk_io_write_name_suffix       | ""       | No       |                                  |
| disk_io_write_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Ingress Traffic

Query:
```terraform
avg(${var.ingress_traffic_evaluation_period}):avg:docker.net.bytes_rcvd{${local.ingress_traffic_filter}} by {container_name,host${local.by_cluster}} > ${var.ingress_traffic_critical}
```

| variable                          | default  | required | description                      |
|-----------------------------------|----------|----------|----------------------------------|
| ingress_traffic_enabled           | True     | No       |                                  |
| ingress_traffic_warning           | null     | No       |                                  |
| ingress_traffic_critical          |          | Yes      |                                  |
| ingress_traffic_evaluation_period | last_15m | No       |                                  |
| ingress_traffic_note              | ""       | No       |                                  |
| ingress_traffic_docs              | ""       | No       |                                  |
| ingress_traffic_filter_override   | ""       | No       |                                  |
| ingress_traffic_alerting_enabled  | True     | No       |                                  |
| ingress_traffic_no_data_timeframe | null     | No       |                                  |
| ingress_traffic_notify_no_data    | False    | No       |                                  |
| ingress_traffic_ok_threshold      | null     | No       |                                  |
| ingress_traffic_name_prefix       | ""       | No       |                                  |
| ingress_traffic_name_suffix       | ""       | No       |                                  |
| ingress_traffic_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Memory Used Percent

Query:
```terraform
avg(${var.memory_used_percent_evaluation_period}):avg:docker.mem.in_use{${local.memory_used_percent_filter}} by {container_name,host${local.by_cluster}} > ${var.memory_used_percent_critical}
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
| memory_used_percent_no_data_timeframe | null     | No       |                                  |
| memory_used_percent_notify_no_data    | False    | No       |                                  |
| memory_used_percent_ok_threshold      | null     | No       |                                  |
| memory_used_percent_name_prefix       | ""       | No       |                                  |
| memory_used_percent_name_suffix       | ""       | No       |                                  |
| memory_used_percent_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Egress Traffic

Query:
```terraform
avg(${var.egress_traffic_evaluation_period}):avg:docker.net.bytes_sent{${local.egress_traffic_filter}} by {container_name,host${local.by_cluster}} > ${var.egress_traffic_critical}
```

| variable                         | default  | required | description                      |
|----------------------------------|----------|----------|----------------------------------|
| egress_traffic_enabled           | True     | No       |                                  |
| egress_traffic_warning           | null     | No       |                                  |
| egress_traffic_critical          |          | Yes      |                                  |
| egress_traffic_evaluation_period | last_15m | No       |                                  |
| egress_traffic_note              | ""       | No       |                                  |
| egress_traffic_docs              | ""       | No       |                                  |
| egress_traffic_filter_override   | ""       | No       |                                  |
| egress_traffic_alerting_enabled  | True     | No       |                                  |
| egress_traffic_no_data_timeframe | null     | No       |                                  |
| egress_traffic_notify_no_data    | False    | No       |                                  |
| egress_traffic_ok_threshold      | null     | No       |                                  |
| egress_traffic_name_prefix       | ""       | No       |                                  |
| egress_traffic_name_suffix       | ""       | No       |                                  |
| egress_traffic_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Disk Io Read

Query:
```terraform
avg(${var.disk_io_read_evaluation_period}):avg:docker.io.read_bytes{${local.disk_io_read_filter}} by {container_name,host${local.by_cluster}} > ${var.disk_io_read_critical}
```

| variable                       | default  | required | description                      |
|--------------------------------|----------|----------|----------------------------------|
| disk_io_read_enabled           | True     | No       |                                  |
| disk_io_read_warning           | null     | No       |                                  |
| disk_io_read_critical          |          | Yes      |                                  |
| disk_io_read_evaluation_period | last_15m | No       |                                  |
| disk_io_read_note              | ""       | No       |                                  |
| disk_io_read_docs              | ""       | No       |                                  |
| disk_io_read_filter_override   | ""       | No       |                                  |
| disk_io_read_alerting_enabled  | True     | No       |                                  |
| disk_io_read_no_data_timeframe | null     | No       |                                  |
| disk_io_read_notify_no_data    | False    | No       |                                  |
| disk_io_read_ok_threshold      | null     | No       |                                  |
| disk_io_read_name_prefix       | ""       | No       |                                  |
| disk_io_read_name_suffix       | ""       | No       |                                  |
| disk_io_read_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable             | default  | required | description  |
|----------------------|----------|----------|--------------|
| filter_str           |          | Yes      |              |
| env                  |          | Yes      |              |
| service              |          | Yes      |              |
| notification_channel |          | Yes      |              |
| additional_tags      | []       | No       |              |
| locked               | False    | No       |              |
| name_prefix          | ""       | No       |              |
| name_suffix          | ""       | No       |              |
| runs_in_k8s          | False    | No       |              |


