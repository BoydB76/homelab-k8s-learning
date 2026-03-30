terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_lxc" "k3s_node" {
  target_node  = var.target_node
  hostname     = var.hostname
  ostemplate   = var.ostemplate
  password     = var.password
  unprivileged = false  # k3s needs privileged
  
  # Root filesystem
  rootfs {
    storage = var.storage
    size    = var.disk_size
  }
  
  # Resources
  cores  = var.cores
  memory = var.memory
  swap   = var.swap
  
  # Network
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "${var.ip_address}/24"
    gw     = var.gateway
  }
  
  # DNS
  nameserver = var.nameserver
  
  # k3s requirements
  features {
    nesting = true
    keyctl  = true
  }
  
  # Start settings
  onboot = true
  start  = true
}
