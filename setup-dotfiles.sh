#! /bin/bash
#set -x
#cleanup with: find ~ -maxdepth 1 -type l -exec unlink {} \;

OS=$(uname -s)

f_source_aliases(){
    # source only relevant aliases

    # Darwin vs Linux
      # .bash_aliases_darwin 
    # root ?
      #  .bash_aliases_root 
    # office vs priv
    # split in different files: git, docker, k8s, rest, private 
    # .bash_aliases .bash_aliases_color .bash_aliases_docker .bash_aliases_git .bash_aliases_k8s .bash_aliases_other.bash_aliases_ssh .bash_aliases_work
    echo
}
#Centos 7 has still git 1.8
if $(git --version | awk '{ print $3 }' | grep -q ^1) ; then
    echo "git version <2 is not supported"
    echo "you could try to git a repo with newer i.e. : 
    yum install http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm && yum update git"
    exit 5
fi

# assure that this is run from actual dir i.e ./setup-dotfiles.sh
if [[ $0 != ./setup-dotfiles.sh ]];then
    echo "Please run this script from within the dir to avoid problems. Exit!"
    exit 4
fi

MYPATH=$(pwd)
#TODO: validate if there already is a .git dir in a parent path and warn then

f_dotfilelink(){
  #for dotfile in $(find $MYPATH -maxdepth 1| grep "/"); do
  for dotfile in $(ls -a -c1 $MYPATH/dotfiles | grep "[a-zA-Z0-9]"); do
      file=$(basename $dotfile)
      if [ x$file == x.tmux.conf.color ]; then
          if [ -e ~/$file ]; then
              echo "preserving $file"
              continue
          else
              echo "you can customize your tmux colors in $file"
              cp ${MYPATH}/dotfiles/${dotfile} ~/$file
          fi
      elif [ -e ~/$file -a ! -L ~/$file ]; then
          echo "moving ~/$file ~/$file.orig-$(date +%F)"
          mv ~/$file ~/$file.orig-$(date +%F)
          echo "linking $file"
          ln -s ${MYPATH}/dotfiles/${dotfile} ~/$file
      elif [ ! -e ~/$file ]; then
          echo "linking $file"
          ln -s ${MYPATH}/dotfiles/${dotfile} ~/$file
      else 
  	echo "$file is already linked"
      fi
  done
}


f_complete_alias(){
  exit 1
  #cd ~/complete-alias
  #git submodule init
  #git submodule update
  
  #grep -q ". ./.complete_alias" completions/bash_completion.sh || echo ". ~/.complete_alias" >> completions/bash_completion.sh
  #if ! [[ -L ~/.bash_completion ]] ; then
  #    ln -s completions/bash_completion.sh ~/.bash_completion
  #fi
}


f_vim_submodules(){
  cd ~/.vim
  git submodule init
  git submodule update
  cd ~
}


f_zsh(){
  if $(which zsh); then
      if ! [ -e  ~/.oh-my-zsh/ ]; then
       #   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
       echo "temporary disabled oh-my-zsh update"
      fi
  else
      echo 'No zsh installed'
      mv ~/.zshrc  ~/.zshrc_not_installed
  fi
}

cd ~
f_source_aliases
f_dotfilelink
#broken  f_complete_alias
f_vim_submodules
f_zsh
