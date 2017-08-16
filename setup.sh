#!/bin/sh

pwd=${0%%setup.sh}
zshd="$HOME"/.zsh.d
files='profile shenv shrc'

cd $HOME
if [ -e ${zshd} ]; then
#    echo "${zshd} exists. Aborted."
#else
    ln -s ${pwd} .zsh.d
    for f in ${files}; do
	file=".z$f"
	if [ -e ${file} ]; then
	    echo "$HOME/$file exists. Aborted."
	    break
	else
	    ln -s ${pwd}z$f $file
	fi
    done
fi
cd - > /dev/null
