#! /bin/bash
#set -x
MYPATH=/home/nox/github/noxdotfiles/is24
cd /

for dotfile in $(find $MYPATH -maxdepth 1| grep "/"); do
    file=$(basename $dotfile)
    if [ -f ~/$file -a ! -L ~/$file ]; then
	    mv ~/$file ~/$file.orig-$(date +%F)
    fi
    if ! [ -L ~/$file ]; then
        echo "linking $file"
        ln -s $dotfile ~/$file
    fi
done 	
