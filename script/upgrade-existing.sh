
echo "==> Disabling periodic apt upgrades"
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

echo "==> Updating list of repositories"
# apt-get update does not actually perform updates, it just downloads and indexes the list of packages
apt-get -y update
apt-get -y upgrade
