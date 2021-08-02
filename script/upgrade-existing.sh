
# Seems redundant with the contents of the preseed file...but leaving for now...
echo "==> Disabling periodic apt upgrades"
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

# The update and upgrade also seem redundant...though leaving for now,
# and if they are the upgrade should effectively be a no-op anyway.
echo "==> Updating list of repositories"
apt-get -y update

echo "==> Upgrading all existing packages to their current version"
apt-get -y upgrade
