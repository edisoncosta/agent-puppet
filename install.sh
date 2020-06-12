#!/bin/bash

VERSION=$1

cd /tmp
wget http://apt.puppetlabs.com/puppet$VERSION-release-$(lsb_release -sc).deb
dpkg -i puppet$VERSION-release-$(lsb_release -sc).deb
apt-get update

apt-get -y install puppet-agent

if ! echo $PATH | grep -q /opt/puppetlabs/bin ; then
  export PATH=$PATH:/opt/puppetlabs/bin
fi
      
mkdir -p /etc/facter/facts.d
