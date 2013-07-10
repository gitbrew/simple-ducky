#!/bin/bash
#update.sh - update simple-ducky and all submodules

#update simple-ducky whether we're local or not
if ! [ -a ./simple-ducky.sh ] && ! [ -a ./.git/config ]
	cd /usr/share/simple-ducky
fi

git pull

# Update submodules
git submodule foreach git checkout master
git submodule foreach git pull
git commit -a -m 'updated submodules'
