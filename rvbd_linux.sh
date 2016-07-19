#!/bin/bash
mkdir -p ~/.juniper_networks/network_connect/
unzip ncLinuxApp.jar -d ~/.juniper_networks/network_connect/
sudo chown root:root ~/.juniper_networks/network_connect/ncsvc
sudo chmod 6711 ~/.juniper_networks/network_connect/ncsvc
chmod 744 ~/.juniper_networks/network_connect/ncdiag

chmod a+x jnc

sudo cp jnc /usr/local/bin

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	echo "install packages::"
	OS=`awk -F= '/^NAME/{print $2}' /etc/os-release`
	echo ":On Debian/Ubuntu:"
	if [ ${OS} == "Ubuntu" ]
	then
		sudo apt-get install libc6-i386 lib32z1 lib32nss-mdns
	else
		echo "On RH 6 and higher:"
		echo "# yum install glibc.i686 zlib.i686 nss.i686"
		exit 1;
	fi
else
  # 32-bit stuff here
fi

