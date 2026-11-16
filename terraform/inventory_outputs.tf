
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
