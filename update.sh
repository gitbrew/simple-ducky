#!/bin/bash
#update.sh - update simple-ducky and all submodules

#update simple-ducky
git pull

# Update submodules
git submodule foreach git checkout master
git submodule foreach git pull
git commit -a -m 'updated submodules'
