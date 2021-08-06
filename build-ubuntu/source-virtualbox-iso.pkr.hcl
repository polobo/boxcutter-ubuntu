source "virtualbox-iso" "ubuntu" {
  boot_command = [
    "${var.boot_command_prefix}",
    "${var.boot_subiquity}",
    "${var.boot_command_suffix}"
  ]
  boot_wait              = "5s"
  disk_size              = "${var.disk_size}"
  guest_additions_path   = "VBoxGuestAdditions_{{ .Version }}.iso"
  guest_os_type          = "${var.virtualbox_guest_os_type}"
  hard_drive_interface   = "sata"
  headless               = "${var.headless}"
  http_directory         = "http"
  iso_checksum           = "${var.iso_checksum}"
  iso_urls               = ["${var.iso_url}"]
  output_directory       = "output-${var.vm_name}-virtualbox-iso"
  post_shutdown_delay    = "1m"
  shutdown_command       = "echo '${var.ssh_password}'|sudo -S shutdown -P now"
  ssh_handshake_attempts = "20"
  ssh_password           = "${var.ssh_password}"
  ssh_username           = "${var.ssh_username}"
  ssh_wait_timeout       = "10000s"
  vboxmanage = [
    ["modifyvm", "{{ .Name }}", "--nictype1", "virtio"],
    ["modifyvm", "{{ .Name }}", "--memory", "${var.memory}"],
    ["modifyvm", "{{ .Name }}", "--cpus", "${var.cpus}"]
  ]
  virtualbox_version_file = ".vbox_version"
  vm_name                 = "${var.vm_name}"
}

variable "virtualbox_guest_os_type" {
  type    = string
  default = "Ubuntu_64"
}
