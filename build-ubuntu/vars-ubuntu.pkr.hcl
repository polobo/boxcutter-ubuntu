variable "boot_command_prefix" {
  type    = string
  default = "<enter><enter><f6><esc><wait>"
}

variable "boot_subiquity" {
  type    = string
  default = "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/"
}

variable "boot_command_suffix" {
  type    = string
  default = "<wait><enter>"
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
