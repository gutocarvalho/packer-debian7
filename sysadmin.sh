#!/bin/bash

wget http://apt.puppetlabs.com/puppetlabs-release-pc1-wheezy.deb
dpkg -i puppetlabs-release-pc1-wheezy.deb
rm -f puppetlabs-release-pc1-wheezy.deb
sudo rm /var/lib/apt/lists/* -vf
sudo apt-get clean
apt-get update
apt-get -y upgrade
apt-get install -y git vim curl wget rsync screen dnsutils netcat telnet puppet-agent elinks lynx bzip2 unzip tcpdump man-db mlocate ccze htop traceroute nfs-common

cat <<'EOF' > /root/.screenrc
shell -$SHELL
startup_message off
defscrollback 5000
hardstatus alwayslastline '%{= wk}%?%-Lw%?%{r}(%{k}%n*%f%t%?(%u)%?%{r})%{k}%?%+Lw%?%?%= %m/%d %C%A'
activity ''
termcapinfo xterm* 'hs:ts=\\E]2;:fs=\\007:ds=\\E]2;screen\\007'
EOF

echo "export PATH=\$PATH:/opt/puppetlabs/bin" > /etc/profile.d/puppet_path.sh
chmod 755 /etc/profile.d/puppet_path.sh
source /etc/profile.d/puppet_path.sh