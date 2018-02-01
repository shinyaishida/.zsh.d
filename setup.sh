#!/bin/sh

pwd=$(pwd)/${0%%setup.sh}
zshd=.zsh.d
files='zprofile zshenv zshrc'

cd $HOME
if [ -e ${zshd} ]; then
    echo "$HOME/${zshd} exists."
else
    ln -s ${pwd} ${zshd}
fi
for file in ${files}; do
    dotfile=.${file}
    if [ -e ${dotfile} ]; then
	echo "$HOME/${dotfile} exists."
    else
	ln -s ${zshd}/${file} ${dotfile}
    fi
done
cd - > /dev/null
