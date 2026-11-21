list "truenas_pool" "all" {
  provider         = truenas
  include_resource = true
}

list "truenas_dataset" "all" {
  provider         = truenas
  include_resource = true
}

list "truenas_smb_share" "all" {
  provider         = truenas
  include_resource = true
}

list "truenas_nfs_share" "all" {
  provider         = truenas
  include_resource = true
}

list "truenas_network_interface" "all" {
  provider         = truenas
  include_resource = true
}

list "truenas_snapshot" "all" {
  provider         = truenas
  include_resource = true
}

list "truenas_service" "all" {
  provider         = truenas
  include_resource = true
}