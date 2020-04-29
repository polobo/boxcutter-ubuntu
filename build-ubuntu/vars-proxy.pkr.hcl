variable "ftp_proxy" {
  type    = string
  default = "${env("ftp_proxy")}"
}

variable "http_proxy" {
  type    = string
  default = "${env("http_proxy")}"
}

variable "https_proxy" {
  type    = string
  default = "${env("https_proxy")}"
}

variable "no_proxy" {
  type    = string
  default = "${env("no_proxy")}"
}

variable "rsync_proxy" {
  type    = string
  default = "${env("rsync_proxy")}"
}
