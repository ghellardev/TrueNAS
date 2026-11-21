# Declare useful Terraform outputs here.


output "nas_hostname" {
  value = data.truenas_network_config.current.hostname
}

output "nas_dns_servers" {
  value = [
    data.truenas_network_config.current.nameserver1,
    data.truenas_network_config.current.nameserver2,
    data.truenas_network_config.current.nameserver3
  ]
}

output "docker_storage_pool" {
  value = data.truenas_docker_config.current.pool
}

output "docker_storage_dataset" {
  value = data.truenas_docker_config.current.dataset
}

output "nvidia_support" {
  value = data.truenas_docker_config.current.nvidia
}

output "nas_timezone" {
  value = data.truenas_system_general.current.timezone
}


# System dataset
output "system_dataset" {
  value = {
    pool = data.truenas_system_dataset.current.pool
    path = data.truenas_system_dataset.current.path
  }
}

# SSH configuration
output "ssh_configuration" {
  value = {
    port            = data.truenas_ssh_config.current.tcpport
    password_auth   = data.truenas_ssh_config.current.passwordauth
    compression     = data.truenas_ssh_config.current.compression
    tcp_forward     = data.truenas_ssh_config.current.tcpfwd
    bind_interfaces = data.truenas_ssh_config.current.bindiface
  }
}

# SMB configuration
output "smb_configuration" {
  value = {
    workgroup    = data.truenas_smb_config.current.workgroup
    netbios_name = data.truenas_smb_config.current.netbiosname
    encryption   = data.truenas_smb_config.current.encryption
    multichannel = data.truenas_smb_config.current.multichannel
    ntlmv1_auth  = data.truenas_smb_config.current.ntlmv1_auth
  }
}

# NFS configuration
output "nfs_configuration" {
  value = {
    protocols = data.truenas_nfs_config.current.protocols
    servers   = data.truenas_nfs_config.current.servers
    bind_ips  = data.truenas_nfs_config.current.bindip
  }
}

# Service status

output "service_status" {
  description = "Current TrueNAS service status"
  value = {
    cifs  = { enabled = truenas_service.smb.enabled, running = truenas_service.smb.running }
    ftp   = { enabled = truenas_service.ftp.enabled, running = truenas_service.ftp.running }
    iscsi = { enabled = data.truenas_service.iscsi.enabled, running = data.truenas_service.iscsi.running }
    nfs   = { enabled = data.truenas_service.nfs.enabled, running = data.truenas_service.nfs.running }
    snmp  = { enabled = truenas_service.snmp.enabled, running = truenas_service.snmp.running }
    ssh   = { enabled = truenas_service.ssh.enabled, running = truenas_service.ssh.running }
    ups   = { enabled = truenas_service.ups.enabled, running = truenas_service.ups.running }
    nvmet = { enabled = data.truenas_service.nvmet.enabled, running = data.truenas_service.nvmet.running }
  }
}

# Immich application
#output "immich_application" {
# value = {
#  version           = data.truenas_app.immich.version
# human_version     = data.truenas_app.immich.human_version
#state             = data.truenas_app.immich.state
#catalog_app       = data.truenas_app.immich.catalog_app
#upgrade_available = data.truenas_app.immich.upgrade_available
#}
#}
