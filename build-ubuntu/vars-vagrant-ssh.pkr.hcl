local "ssh_username" {
  # This is presently hard-coded into user-data
  expression = "vagrant"
}

local "ssh_password" {
  # This is presently hard-coded into user-data
  expression = "vagrant"
}

local "ssh_handshake_attempts" {
  type    = string
  default = "20"
}

local "ssh_wait_timeout" {
  type    = string
  default = "10000s"
}
