#! /bin/bash
#set -x
# assure that this is run from actual dir i.e ./dotfilelinker.sh
if [[ $0 != ./dotfilelinker.sh ]];then
    echo "Please run this script from within the dir to avoid problems. Exit!"
    exit 4
fi

MYPATH=$(pwd)

for dotfile in $(find $MYPATH -maxdepth 1| grep "/"); do
    file=$(basename $dotfile)
    if [ x$file == xpartial ] ; then
        # only link single files within instead of whole dir
        echo "partial not yet implemented. Please link yourself if needed"
        continue

#        ### fix later
#        cd $file
#        for DIR in $(find  -type d | sed s'#./#~/#' | grep /); do
#            mkdir -p $DIR
#        done
#        for FILE in $(find  -type d | sed s'#./#~/#' | grep /); do
#            if [ -e $FILE -a ! -L $FILE ]; then
#	            mv $FILE $FILE.orig-$(date +%F)
#            fi
#        done
#        continue
#        #### 
    fi
    if [ -e ~/$file -a ! -L ~/$file ]; then
	    mv ~/$file ~/$file.orig-$(date +%F)
    fi
    if ! [ -L ~/$file ]; then
        if ! [ x$file == xdotfilelinker.sh ]; then
            echo "linking $file"
            ln -s $dotfile ~/$file
        fi
    fi
done 	
cd ~/.vim
git submodule init
git submodule update

cd ~
