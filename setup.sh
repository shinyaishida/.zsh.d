#!/bin/sh

readonly zshd=.zsh.d
readonly zsh_home="$HOME/${zshd}"
readonly files='zprofile zshenv zshrc'

if [ ! -d "${zsh_home}" ]; then
  cd "${0%/*}" || exit 1
  ln -s "$(pwd)" "${zsh_home}"
  cd - || exit 2
fi
for file in ${files}; do
  dotfile="$HOME/.${file}"
  if [ -e "${dotfile}" ]; then
    echo "${dotfile} exists."
  else
    ln -s "${zsh_home}/${file}" "${dotfile}"
  fi
done
