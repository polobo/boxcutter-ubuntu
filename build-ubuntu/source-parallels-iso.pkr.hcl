source "parallels-iso" "ubuntu" {
  boot_command = [
    "${var.boot_command_prefix}",
    "${var.boot_subiquity}",
    "${var.boot_command_suffix}"
  ]
  boot_wait              = "5s"
  disk_size              = "${var.disk_size}"
  guest_os_type          = "${var.parallels_guest_os_type}"
  http_directory         = "http"
  iso_checksum           = "${var.iso_checksum}"
  iso_urls               = ["${var.iso_url}"]
  output_directory       = "output-${var.vm_name}-parallels-iso"
  parallels_tools_flavor = "lin"
  prlctl = [
    ["set", "{{ .Name }}", "--memsize", "${var.memory}"],
    ["set", "{{ .Name }}", "--cpus", "${var.cpus}"]
  ]
  prlctl_version_file    = ".prlctl_version"
  shutdown_command       = "echo '${var.ssh_password}'|sudo -S shutdown -P now"
  ssh_handshake_attempts = "20"
  ssh_password           = "${var.ssh_password}"
  ssh_username           = "${var.ssh_username}"
  ssh_wait_timeout       = "10000s"
  vm_name                = "${var.vm_name}"
}

variable "parallels_guest_os_type" {
  type    = string
  default = "ubuntu"
}
