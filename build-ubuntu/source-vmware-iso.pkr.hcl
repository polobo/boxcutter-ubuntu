source "vmware-iso" "ubuntu" {
  tools_upload_flavor    = "linux"

  vm_name                = "${var.vm_name}"

  boot_command           = "${local.boot_command_array}"
  boot_wait              = "${local.boot_wait}"
  disk_size              = "${var.disk_size}"
  guest_os_type          = "${local.vmware_guest_os_type}"
  headless               = "${var.headless}"
  http_directory         = "${local.repo_http_dir}"
  iso_checksum           = "${var.iso_checksum}"
  iso_urls               = ["${var.iso_url}"]
  output_directory       = "${local.vmware_output_dir}"
  shutdown_command       = "${local.shutdown_command}"
  ssh_handshake_attempts = "${var.ssh_handshake_attempts}"
  ssh_password           = "${var.ssh_password}"
  ssh_timeout            = "${var.ssh_wait_timeout}"
  ssh_username           = "${var.ssh_username}"

  vmx_remove_ethernet_interfaces = true
  vmx_data = {
    "ethernet0.pciSlotNumber" = "32"
    #memsize                   = "${var.memory}" # Warning
    #numvcpus                  = "${var.cpus}"   # Warning
  }
}

local "vmware_guest_os_type" {
  expression = "ubuntu-64"
}

local "vmware_output_dir" {
  expression = "output-${var.vm_name}-vmware-iso"
}
