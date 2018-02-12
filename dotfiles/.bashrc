export HISTSIZE=100000 # in memory
unset HISTFILESIZE #undefinite lines to remeber
export HISTCONTROL=ignoredups:erasedups  
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

if [ -d ~/bin ]; then
    export PATH=~/bin:$PATH
fi

umask 077

f_source_old(){
# files to be sourced 
for SRCFILE in /etc/bash_completion ~/.bash_aliases ~/.bashrc_functions ~/.bash_alias; do
	if [ -f $SRCFILE ]; then
		. $SRCFILE
	fi
done

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
}
### TODO Handle linux distribution specific aliases (yum vs apt)
###      Handle work and privat aliases better

f_source_new(){
  # not ready needs case handling 
  for SRCFILE in  $(find ~/.bash_source.d/ -type f); do 
  	if [ -f $SRCFILE ]; then
  		. $SRCFILE
  	fi
  done
}

f_source_local(){
  ###################################
  # your changes and overwrites here:
  if [ -f ~/.bashrc_local ]; then
          . ~/.bashrc_local
  fi
  ###################################
}
f_source_old
f_source_new
f_source_local
cd ~

