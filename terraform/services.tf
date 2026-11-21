# File sharing
resource "truenas_service" "smb" {
  name    = "cifs"
  enabled = true
  running = true
}

# Network and storage services
resource "truenas_service" "nfs" {
  name    = "nfs"
  enabled = false
  running = false
}

resource "truenas_service" "iscsi" {
  name    = "iscsitarget"
  enabled = false
  running = false
}

resource "truenas_service" "nvmet" {
  name    = "nvmet"
  enabled = false
  running = false
}

# Remote access and monitoring
resource "truenas_service" "ssh" {
  name    = "ssh"
  enabled = false
  running = false
}

resource "truenas_service" "ftp" {
  name    = "ftp"
  enabled = false
  running = false
}

resource "truenas_service" "snmp" {
  name    = "snmp"
  enabled = false
  running = false
}

resource "truenas_service" "ups" {
  name    = "ups"
  enabled = true
  running = true
}
