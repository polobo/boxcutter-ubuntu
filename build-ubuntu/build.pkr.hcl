build {
  sources = ["source.parallels-iso.ubuntu", "source.virtualbox-iso.ubuntu", "source.vmware-iso.ubuntu"]

  provisioner "shell" {
    environment_vars  = ["CLEANUP_PAUSE=${var.cleanup_pause}", "DEBIAN_FRONTEND=noninteractive", "DESKTOP=${var.desktop}", "UPGRADE_RELEASE=${var.upgrade_release}", "INSTALL_VAGRANT_KEY=${var.install_vagrant_key}", "SSH_USERNAME=${var.ssh_username}", "SSH_PASSWORD=${var.ssh_password}", "http_proxy=${var.http_proxy}", "https_proxy=${var.https_proxy}", "ftp_proxy=${var.ftp_proxy}", "rsync_proxy=${var.rsync_proxy}", "no_proxy=${var.no_proxy}"]
    execute_command   = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S bash '{{ .Path }}'"
    expect_disconnect = "true"
    scripts           = ["script/upgrade-release.sh", "script/upgrade-existing.sh", "script/desktop.sh", "script/vagrant.sh", "script/sshd.sh", "script/vmware.sh", "script/virtualbox.sh", "script/parallels.sh", "script/motd.sh", "${var.custom_script}", "script/minimize.sh", "script/cleanup.sh"]
  }

  post-processor "vagrant" {
    keep_input_artifact  = false
    output               = "box/<no value>/${var.vm_name}-${var.interactive_mode}-${var.version}.box"
    vagrantfile_template = "${var.vagrantfile_template}"
  }
}
