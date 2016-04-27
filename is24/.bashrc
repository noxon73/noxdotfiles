#
##
### local changes to .bashrc_local!!!
### otherwise they will be lost
##
#
#echo "loading .bashrc"

#always save history directly
export PROMPT_COMMAND='history -a;'

if $(hostname | grep -q secure-you); then
	COL=31
else 
	COL=37 
fi
if [ x$USER = xroot ]; then 
    if [ -f ~/.bash_aliases_root ]; then
        . ~/.bash_aliases_root
    fi 
    if !  $(hostname | grep -q nox.loc);then
	export PS1='\[\033[31;40m\]\h:\[\033[32;40m\]\w\[\033[33;40m\]$\[\033[0m\]'
    else
	export PS1="\[\033[$COL;44m\]\h:\w\$\[\033[0m\] "
    fi
else
    export PS1="\[\033[$COL;44m\]\u@\h:\w\$\[\033[0m\] "
fi
umask 022
# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval `dircolors`
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
export HISTFILESIZE=100000
export HISTSIZE=100000
export   HISTCONTROL=ignoredups

# files to be sourced
for SRCFILE in /etc/bash_completion /.bash_aliases /.bashrc_functions /.bash_alias; do
	if [ -f $SRCFILE ]; then
		. $SRCFILE
	fi
done

###################################
# your changes and overwrites here:
if [ -f ~/.bashrc_local ]; then
        . ~/.bashrc_local
fi
###################################

cd ~
