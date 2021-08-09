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

local "repo_http_dir" {
  expression = "http"
}

local "shutdown_command" {
  expression = "echo '${var.ssh_password}'|sudo -S shutdown -P now"
}

variable "cleanup_pause" {
  type    = string
  default = ""
}

variable "vm_name" {
  type = string
}

variable "hostname" {
  type    = string
  default = "vagrant"
}

variable "desktop" {
  type    = string
  default = "false"
}

variable "interactive_mode" {
  type    = string
  default = "server"
}

variable "version" {
  type = string
}

variable "iso_checksum" {
  type = string
}

variable "iso_url" {
  type = string
}

variable "upgrade_release" {
  type    = string
  default = "false"
}

variable "locale" {
  type    = string
  default = "en_US.UTF-8"
}

variable "headless" {
  type    = string
  default = "true"
}
