
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
#    if !  $(hostname | grep -q nox.loc);then
#	export PS1='\[\033[31;40m\]\h:\[\033[32;40m\]\w\[\033[33;40m\]$\[\033[0m\]'
#    else
	export PS1="\[\033[$COL;44m\]\h:\w\$\[\033[0m\] "
#    fi
############ /root  ############

else
    export PS1="\[\033[$COL;44m\]\u@\h:\w\$\[\033[0m\] "
fi


###################################
# your changes and overwrites here:
if [ -f ~/.bashrc_local ]; then
        . ~/.bashrc_local
fi
###################################
 
cd ~

