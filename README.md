# Packer templates for Ubuntu written in legacy JSON

### Overview

This repository contains [Packer](https://packer.io/) templates for creating Ubuntu Vagrant boxes

## Development Versioning Information

Please see the files under development-environments for published combinations used during the
development and testing of patches for this repository.

## Current Boxes

We no longer provide pre-built binaries for these templates.

## Building the Vagrant boxes with Packer

We make use of HCL files containing user variables to build specific versions of Ubuntu.
You tell `packer` to use a specific user variable file via the `-var-file=` command line
option.

The general form for the `packer build` command is:
```
    packer build \
        [-only=<template-type>] \
        [-var-file=ubuntu-add-desktop.pkvars.hcl] \
        -var-file=ubuntu{release}.pkvars.hcl \
        -var="version={yyyymmdd-n}" \
        build-ubuntu
```

The boxcutter templates currently support the following desktop virtualization (template-type above) strings:

* `parallels-iso.ubuntu` - [Parallels](http://www.parallels.com/products/desktop/whats-new/) desktop virtualization (Requires the Pro Edition - Desktop edition won't work)
* `virtualbox-iso.ubuntu` - [VirtualBox](https://www.virtualbox.org/wiki/Downloads) desktop virtualization
* `vmware-iso.ubuntu` - [VMware Fusion](https://www.vmware.com/products/fusion) or [VMware Workstation](https://www.vmware.com/products/workstation) desktop virtualization

Parallels requires that the
[Parallels Virtualization SDK for Mac](http://www.parallels.com/downloads/desktop)
be installed as an additional prerequisite.

If no single template type is specified the builder will attempt to build out all the desktop virtualization
products listed above and will fail if those applications have not been installed.

### Variable overrides

There are two files the define the variables that the user is permitted
(but not enforced) to change at the `packer` command-line.

* build-ubuntu/vars-interactive.pkr.hcl
* build-ubuntu/vars-vm-default.pkr.hcl

A third file should be referenced if the virtual machine will require
a network proxy.

* build-ubuntu/vars-proxy.pkr.hcl

The only required variable, as noted above, is "version".

The variables representing the primary non-root user and its password are
presently local variables due to the `http/user-data` file being a
non-template with those values hard-coded.

### Proxy Settings

The templates respect the following network proxy environment variables
and forward them on to the virtual machine environment during the box creation
process.

* http_proxy
* https_proxy
* ftp_proxy
* rsync_proxy
* no_proxy

### Tests

Automated tests are written in [Serverspec](http://serverspec.org) and require
the `vagrant-serverspec` plugin to be installed with:

    vagrant plugin install vagrant-serverspec

## Contributing


1. Fork and clone the repo.
2. Create a new branch, please don't work in your `master` branch directly.
3. Add new [Serverspec](http://serverspec.org/) or [Bats](https://blog.engineyard.com/2014/bats-test-command-line-tools) tests in the `test/` subtree for the change you want to make.  Run `make test` on a relevant template to see the tests fail (like `make test-virtualbox/ubuntu1804`).
4. Fix stuff.  Use `make ssh` to interactively test your box (like `make ssh-virtualbox/ubuntu1804`).
5. Run `make test` on a relevant template (like `make test-virtualbox/ubuntu1804`) to see if the tests pass.  Repeat steps 3-5 until done.
6. Update `README.md` and `AUTHORS` to reflect any changes.
7. If you have a large change in mind, it is still preferred that you split them into small commits.  Good commit messages are important.  The git documentatproject has some nice guidelines on [writing descriptive commit messages](http://git-scm.com/book/ch5-2.html#Commit-Guidelines).
8. Push to your fork and submit a pull request.
9. Once submitted, a full `make test` run will be performed against your change in the build farm.  You will be notified if the test suite fails.

### Would you like to help out more?

Contact moujan@annawake.com 

### Acknowledgments

[Parallels](http://www.parallels.com/) provided a Business Edition license of
their software to run on the basebox build farm.

<img src="http://www.parallels.com/fileadmin/images/corporate/brand-assets/images/logo-knockout-on-red.jpg" width="80">

[SmartyStreets](http://www.smartystreets.com) provided basebox hosting for the box-cutter project since 2015 - thank you for your support!

<img src="https://d79i1fxsrar4t.cloudfront.net/images/brand/smartystreets.65887aa3.png" width="320">
