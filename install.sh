#!/bin/bash -x
# install.sh - install simple-ducky


if [ "${UID}" != "0" ]; then
	echo -e "\e[1;31m[!] This script must be run as root\e[0m" 1>&2
	exit 1
else
	if ! [ -a /usr/share/simple-ducky/simple-ducky.sh ] && ! [ -a /usr/share/simple-ducky/update.sh ]; then
		git clone --recursive git@github.com:gitbrew/simple-ducky.git /usr/share/simple-ducky
	fi
	ln -sf /usr/share/simple-ducky/simple-ducky.sh /usr/bin/simple-ducky
	ln -sf /usr/share/simple-ducky/update.sh /usr/bin/simple-ducky-update
fi
