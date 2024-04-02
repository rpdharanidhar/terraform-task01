# output "kubeconfig" {
#   description = "Kubeconfig content for connecting to the Kubernetes cluster"
#   value       = oci_containerengine_cluster.my-cluster.kube_config.content
# }

output "cluster_id" {
  description = "The OCID of the Kubernetes cluster"
  value       = oci_containerengine_cluster.my-cluster.id
}

output "cluster_name" {
  description = "The name of the Kubernetes cluster"
  value       = oci_containerengine_cluster.my-cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint for the Kubernetes API server"
  value       = oci_containerengine_cluster.my-cluster.kubernetes_version
}

output "cluster_ip" {
  description = "The ip address for the Kubernetes API server"
  value       = oci_containerengine_cluster.my-cluster.endpoints
}