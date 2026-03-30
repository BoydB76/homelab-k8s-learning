variable "target_node" {
  description = "Proxmox node name"
  type        = string
}

variable "hostname" {
  description = "Container hostname"
  type        = string
}

variable "ostemplate" {
  description = "OS template location"
  type        = string
}

variable "password" {
  description = "Root password"
  type        = string
  sensitive   = true
}

variable "storage" {
  description = "Storage location"
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "20G"
}

variable "cores" {
  description = "CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "swap" {
  description = "Swap in MB"
  type        = number
  default     = 512
}

variable "ip_address" {
  description = "IP address (without subnet mask)"
  type        = string
}

variable "gateway" {
  description = "Default gateway"
  type        = string
  default     = "192.168.1.1"
}

variable "nameserver" {
  description = "DNS nameserver"
  type        = string
  default     = "192.168.1.149"
}
