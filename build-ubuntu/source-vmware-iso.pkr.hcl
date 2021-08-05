source "vmware-iso" "ubuntu" {
  boot_command           = ["${var.boot_command_prefix}", "${var.boot_subiquity}", "${var.boot_command_suffix}"]
  boot_wait              = "5s"
  disk_size              = "${var.disk_size}"
  guest_os_type          = "${var.vmware_guest_os_type}"
  headless               = "${var.headless}"
  http_directory         = "http"
  iso_checksum           = "${var.iso_checksum}"
  iso_urls               = ["${var.iso_url}"]
  output_directory       = "output-${var.vm_name}-vmware-iso"
  shutdown_command       = "echo '${var.ssh_password}'|sudo -S shutdown -P now"
  ssh_handshake_attempts = "20"
  ssh_password           = "${var.ssh_password}"
  ssh_timeout            = "10000s"
  ssh_username           = "${var.ssh_username}"
  tools_upload_flavor    = "linux"
  vm_name                = "${var.vm_name}"
  vmx_data = {
    "ethernet0.pciSlotNumber" = "32"
    #memsize                   = "${var.memory}" # Warning
    #numvcpus                  = "${var.cpus}"   # Warning
  }
  vmx_remove_ethernet_interfaces = true
}

variable "vmware_guest_os_type" {
  type    = string
  default = "ubuntu-64"
}
