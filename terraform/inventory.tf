
data "truenas_network_config" "current" {}

data "truenas_docker_config" "current" {}

data "truenas_system_general" "current" {}


# System configuration
data "truenas_system_dataset" "current" {}

# Service configuration
data "truenas_ssh_config" "current" {}
data "truenas_smb_config" "current" {}
data "truenas_nfs_config" "current" {}
data "truenas_ftp_config" "current" {}
data "truenas_snmp_config" "current" {}
data "truenas_ups_config" "current" {}

# Service runtime status
data "truenas_service" "ssh" {
  name = "ssh"
}

data "truenas_service" "smb" {
  name = "cifs"
}

data "truenas_service" "nfs" {
  name = "nfs"
}

data "truenas_service" "iscsi" {
  name = "iscsitarget"
}

data "truenas_service" "nvmet" {
  name = "nvmet"
}


#Application inventory
#data "truenas_app" "immich" {
#  name = "immich"
#}
