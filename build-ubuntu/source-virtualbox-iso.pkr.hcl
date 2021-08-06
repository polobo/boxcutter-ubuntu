source "virtualbox-iso" "ubuntu" {
  guest_additions_path   = "VBoxGuestAdditions_{{ .Version }}.iso"
  hard_drive_interface   = "sata"
  post_shutdown_delay    = "1m"
  virtualbox_version_file = ".vbox_version"

  vm_name                 = "${var.vm_name}"

  boot_command           = "${local.boot_command_array}"
  boot_wait              = "${local.boot_wait}"
  shutdown_command       = "${local.shutdown_command}"

  guest_os_type          = "${local.virtualbox_guest_os_type}"
  headless               = "${var.headless}"
  http_directory         = "${local.repo_http_dir}"

  iso_checksum           = "${var.iso_checksum}"
  iso_urls               = ["${var.iso_url}"]

  output_directory       = "${local.virtualbox_output_dir}"

  ssh_handshake_attempts = "${var.ssh_handshake_attempts}"
  ssh_password           = "${var.ssh_password}"
  ssh_username           = "${var.ssh_username}"
  ssh_wait_timeout       = "${var.ssh_wait_timeout}"

  disk_size              = "${var.disk_size}"
  vboxmanage = [
    ["modifyvm", "{{ .Name }}", "--nictype1", "virtio"],
    ["modifyvm", "{{ .Name }}", "--memory", "${var.memory}"],
    ["modifyvm", "{{ .Name }}", "--cpus", "${var.cpus}"]
  ]
}

local "virtualbox_guest_os_type" {
  expression = "Ubuntu_64"
}

local "virtualbox_output_dir" {
  expression = "output-${var.vm_name}-virtualbox-iso"
}
