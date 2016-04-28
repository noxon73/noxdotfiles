#! /bin/bash
#set -x
MYPATH=~/github/noxdotfiles/is24
# assure that this is run from actual dir i.e ./dotfilelinker.sh
if [[ $0 != ./dotfilelinker.sh ]];then
    echo "Please run this script from within the dir to avoid problems. Exit!"
    exit 4
fi
if ! [ -d $MYPATH ] ; then
	echo "expected checkout in $MYPATH"
fi

cd /

for dotfile in $(find $MYPATH -maxdepth 1| grep "/"); do
    file=$(basename $dotfile)
    if [ -f ~/$file -a ! -L ~/$file ]; then
	    mv ~/$file ~/$file.orig-$(date +%F)
    fi
    if ! [ -L ~/$file ]; then
        if [ x$file == xdotfilelinker.sh ]; then
            continue
        else    
            echo "linking $file"
            ln -s $dotfile ~/$file
        fi
    fi
done 	
cd ~/.vim
git submodule init
git submodule update

cd ~
