output "container_id" {
  description = "Container ID"
  value       = proxmox_lxc.k3s_node.id
}

output "ip_address" {
  description = "Container IP address"
  value       = var.ip_address
}

output "hostname" {
  description = "Container hostname"
  value       = var.hostname
}
