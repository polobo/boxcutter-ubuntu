variable "ssh_fullname" {
  type    = string
  default = "vagrant"
}

variable "ssh_password" {
  type    = string
  default = "vagrant"
}

variable "ssh_username" {
  type    = string
  default = "vagrant"
}

variable "ssh_handshake_attempts" {
  type    = string
  default = "20"
}

variable "ssh_wait_timeout" {
  type    = string
  default = "10000s"
}

variable "install_vagrant_key" {
  type    = string
  default = "true"
}

variable "custom_script" {
  type    = string
  default = "custom-script.sh"
}

variable "vagrantfile_template" {
  type    = string
  default = ""
}
