variable "custom_script" {
  type    = string
  default = "custom-script.sh"
}

variable "headless" {
  type    = string
  default = "true"
}

variable "install_vagrant_key" {
  type    = string
  default = "true"
}

variable "version" {
  description = "This string is used as-is to suffix the box name"
  type = string
  # No default, user must supply this
}
