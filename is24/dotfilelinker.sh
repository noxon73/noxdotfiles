#! /bin/bash
set -x
MYPATH=/home/nox/github/noxdotfiles/is24
cd /

for dotfile in $(find $MYPATH -maxdepth 1| grep "/"); do
    file=$(basename $dotfile)
    if [ -e ~/$file ]; then
	mv ~/$file ~/$file.orig-$(date +%F)
    fi
    ln -s $dotfile ~/$file
done 	
