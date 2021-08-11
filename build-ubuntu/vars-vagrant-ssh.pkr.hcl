local "ssh_username" {
  # This is presently hard-coded into user-data
  expression = "vagrant"
}

local "ssh_password" {
  # This is presently hard-coded into user-data
  expression = "vagrant"
}

local "ssh_handshake_attempts" {
  expression = "200"
}

local "ssh_wait_timeout" {
  expression = "10000s"
}
