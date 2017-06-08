
#always save history directly
export PROMPT_COMMAND='history -a;'
export HISTSIZE=100000 # in memory
unset HISTFILESIZE #undefinite lines to remeber
export HISTCONTROL=ignoredups
shopt -s histappend

if [ -d ~/bin ]; then
    export PATH=~/bin:$PATH
fi

umask 022

# files to be sourced
for SRCFILE in /etc/bash_completion ~/.bash_aliases ~/.bashrc_functions ~/.bash_alias; do
	if [ -f $SRCFILE ]; then
		. $SRCFILE
	fi
done


#if $(hostname | grep -q secure-you); then
#	COL=31
#else 
#	COL=37 
#fi
############ root  ############
if [ x$USER = xroot ]; then 
    if [ -f ~/.bash_aliases_root ]; then
        . ~/.bash_aliases_root
    fi 
fi
# do we want to handle PS1?

### OS check ###
if [[ $(uname) == Darwin ]] ;then
    export MY_OS=Darwin
    export LS_OPTIONS=''
    [ -f ~/.bash_aliases_darwin ] && . ~/.bash_aliases_darwin
else # should be linux
    export LS_OPTIONS='--color=auto'
    eval `dircolors`
fi

###################################
# your changes and overwrites here:
if [ -f ~/.bashrc_local ]; then
        . ~/.bashrc_local
fi
###################################
 
cd ~

