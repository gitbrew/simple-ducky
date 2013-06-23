#update.bat - windows update script

@echo off
git submodule foreach git checkout master
git submodule foreach git pull
git commit -a -m 'updated submodules'
