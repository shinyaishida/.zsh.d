#!/bin/sh

readonly zshd=.zsh.d
readonly zsh_home=$HOME/${zshd}
readonly files='zprofile zshenv zshrc'

[ ! -e ${zsh_home} ] && {
  ln -s $(cd ${0%/*}; pwd) ${zsh_home}
}
for file in ${files}; do
  dotfile=$HOME/.${file}
  [ -e ${dotfile} ] && \
    echo "${dotfile} exists." || \
    ln -s ${zsh_home}/${file} ${dotfile}
done
