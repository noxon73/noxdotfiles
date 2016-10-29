# System
export LS_OPTIONS='--color=auto'
eval `dircolors`
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias mtr='mtr --curses -o "LSD NBAWVJ" '
alias vless="vim -u /usr/share/vim/vim71/macros/less.vim"
alias i6="ip -6"
alias ip6="ip -6"
 
# Docker
alias 4da='docker attach '
alias 4dps='docker ps '
alias 4dnw='docker network ls'

#Docker compose
alias 4dc='docker-compose '

# vserver
alias 4vs="vserver-stat"

# tmux
alias 4tm="sudo -i bash -c 'tmux a -d'"

# GIT
alias 4ga='git add '
alias 4gs='git status'
alias 4gaa='git add -A ; 4gs'
alias 4gd1='git diff HEAD^ HEAD -- '
alias 4gd2='git diff HEAD^^ HEAD -- '
alias 4gd3='git diff HEAD^^^ HEAD -- '
alias 4gm='git commit -m '
alias 4gls='git ls-files '

# Systemd
alias 4sys="systemctl "
alias 4sysd="systemctl daemon-reload "
alias 4sysrestart="4sysd; systemctl restart "
alias 4sysstatus="systemctl status "
#try shorter completion
alias s4="systemctl "
alias s4restart="4sysd; systemctl restart "
alias s4status="systemctl status "

# Work
if [ -d /data/home/egrehm/local/svn/config ]; then
    alias cdc='cd /data/home/egrehm/local/svn/config'
    alias cds='cd /data/home/egrehm/local/svn/source'
elif [ -d /data/my/dockerbuild ]; then
    alias cdm='cd /data/my;'
    alias cds='cd /data/my/scripts; settitle codedir'
    alias cdd='cd /data/my/dockerbuild/$dockdir; settitle dockdir'
    alias 4data='cd /data/container-data; settitle datadir'
fi

alias ssht='TERM=xterm ssh '
alias sshe='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l egrehm'
alias svnup='cdc; svn up; cds; svn up'

# other 

alias 4psauxgrep='ps aux | grep -i '
alias 4pstimesort='ps axwo time,nice,pid,args |sort | tail -10 '
alias 4dmesggrep='dmesg | grep -i '
alias 4pathsearch='ls `echo $PATH | tr ":" " "` | grep -i '
alias 4mangle='iptables -t mangle -vnL'
alias 4gpgkillandrestart='killall gpg-agent && eval $(/usr/bin/gpg-agent --daemon| tee ~/.gnupg/gpg-agent.env)'
alias 4dotfileupdate='dotfileupdate'

# Normal Colors
BLACK='\e[0;30m'        # BLACK
RED='\e[0;31m'          # RED
GREEN='\e[0;32m'        # GREEN
YELLOW='\e[0;33m'       # YELLOW
BLUE='\e[0;34m'         # BLUE
PURPLE='\e[0;35m'       # PURPLE
CYAN='\e[0;36m'         # CYAN
WHITE='\e[0;37m'        # WHITE
 
# BOLD
BBLACK='\e[1;30m'       # BLACK
BRED='\e[1;31m'         # RED
BGREEN='\e[1;32m'       # GREEN
BYELLOW='\e[1;33m'      # YELLOW
BBLUE='\e[1;34m'        # BLUE
BPURPLE='\e[1;35m'      # PURPLE
BCYAN='\e[1;36m'        # CYAN
BWHITE='\e[1;37m'       # WHITE
 
# BACKGROUND
ON_BLACK='\e[40m'       # BLACK
ON_RED='\e[41m'         # RED
ON_GREEN='\e[42m'       # GREEN
ON_YELLOW='\e[43m'      # YELLOW
ON_BLUE='\e[44m'        # BLUE
ON_PURPLE='\e[45m'      # PURPLE
ON_CYAN='\e[46m'        # CYAN                                                                                                    
ON_WHITE='\e[47m'       # WHITE
 
NC='\e[m'               # COLOR RESET
