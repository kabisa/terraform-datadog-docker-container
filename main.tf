locals {
  by_cluster = var.runs_in_k8s ? ",cluster_name" : ""
  on_cluster = var.runs_in_k8s ? "Cluster:{{cluster_name.name}} " : ""
}