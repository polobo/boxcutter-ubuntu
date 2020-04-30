#!/bin/bash -eux

# Disable the release upgrader
echo "==> Disabling the release upgrader"
sed -i.bak 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades

if [[ $UPGRADE_RELEASE  =~ true || $UPGRADE_RELEASE =~ 1 || $UPGRADE_RELEASE =~ yes ]]; then
    echo "==> Performing dist-upgrade (all packages and kernel)"
    apt-get -y dist-upgrade --force-yes
    reboot
    sleep 60
fi
