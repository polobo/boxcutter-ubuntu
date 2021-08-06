source "parallels-iso" "ubuntu" {
  parallels_tools_flavor = "lin"
  prlctl_version_file    = ".prlctl_version"

  vm_name                = "${var.vm_name}"

  boot_command           = "${local.boot_command_array}"
  boot_wait              = "${local.boot_wait}"
  disk_size              = "${var.disk_size}"
  guest_os_type          = "${local.parallels_guest_os_type}"
  http_directory         = "${local.repo_http_dir}"
  iso_checksum           = "${var.iso_checksum}"
  iso_urls               = ["${var.iso_url}"]
  output_directory       = "${local.parallels_output_dir}"

  shutdown_command       = "${local.shutdown_command}"
  ssh_handshake_attempts = "${var.ssh_handshake_attempts}"
  ssh_password           = "${var.ssh_password}"
  ssh_username           = "${var.ssh_username}"
  ssh_wait_timeout       = "${var.ssh_wait_timeout}"

  prlctl = [
    ["set", "{{ .Name }}", "--memsize", "${var.memory}"],
    ["set", "{{ .Name }}", "--cpus", "${var.cpus}"]
  ]

}

local "parallels_guest_os_type" {
  expression = "ubuntu"
}

local "parallels_output_dir" {
  expression = "output-${var.vm_name}-parallels-iso"
}
