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
alias mc='. /usr/libexec/mc/mc-wrapper.sh'
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias mtr='mtr --curses -o "LSD NBAWVJ" '
alias vless="vim -u /usr/share/vim/vim71/macros/less.vim"
 
# Docker
alias 4da='docker attach '
alias 4dps='docker ps '

# vserver
alias 4vs="vserver-stat"

# GIT
alias 4ga='git add '
alias 4gaa='git add -A '
alias 4gd1='git diff HEAD^ HEAD -- '
alias 4gd2='git diff HEAD^^ HEAD -- '
alias 4gd3='git diff HEAD^^^ HEAD -- '
alias 4gm='git commit -m '
alias 4gs='git status'
alias 4gls='git ls-files '

# Systemd
alias 4sys="systemctl "
alias 4sysrestart="systemctl restart "
alias 4sysstatus="systemctl status "

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


# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
 
# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
 
# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan                                                                                                    
On_White='\e[47m'       # White
 
NC="\e[m"               # Color Reset
