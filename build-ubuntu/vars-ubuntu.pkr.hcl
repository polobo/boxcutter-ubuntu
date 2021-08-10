local "boot_command_array" {
  expression = [
    "<enter><enter><f6><esc><wait>",
    "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<wait><enter>"
  ]
}

local "boot_wait" {
  expression = "5s"
}

local "cleanup_pause" {
  type    = string
  default = ""
}

local "shutdown_command" {
  expression = "echo '${var.ssh_password}'|sudo -S shutdown -P now"
}

local "repo_http_dir" {
  expression = "http"
}

local "desktop" {
  # Legacy variable as the scripts are expecting desktop to be true/false
  # while the user-visible value really wants to be desktop/server respectively
  # so that the knowledge of whether a box is a server or desktop build can
  # be incorporated into labels and paths.  See var.interactive_mode for setting
  # desktop/server.
  expression = "${var.interactive_mode == "desktop" ? true : false}"
}

variable "vm_name" {
  type = string
}

variable "interactive_mode" {
  description = <<EOD
    Indicates whether a desktop is to be be installed in the box.
    Not meant for direct usage - the default is server since the iso
    files we build from are server iso files.
    The ubuntu-add-desktop.pkvars.hcl sets this to desktop.
EOD
  type    = string
  default = "server"
}

variable "iso_checksum" {
  description = "Non-Interactive, see ubuntu{version}.pkvars.hcl"
  type = string
}

variable "iso_url" {
  description = "Non-Interactive, see ubuntu{version}.pkvars.hcl"
  type = string
}

variable "vagrantfile_template" {
  type    = string
  default = ""
}
