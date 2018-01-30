#
# .zshenv
#
# '.zshenv' is sourced on all invocations of the shell, unless the '-f' option
# is set. It should contain commands to set the command search path, plus other
# important environment variables. '.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.
#

umask 022
zshConfigPath=~/.zsh.d

function AddPriorPath() {
    [ -d $1 ] && [[ ! $PATH =~ $1 ]] && PATH=$1:$PATH
}

function AddExtraPath() {
    [ -d $1 ] && [[ ! $PATH =~ $1 ]] && PATH=$PATH:$1
}

function AddExtraManPath() {
    [ -d $1 ] && [[ ! $MANPATH =~ $1 ]] && MANPATH=${MANPATH:+$MANPATH:}$1
}

function AddExtraInfoPath() {
    [ -d $1 ] && [[ ! $INFOPATH =~ $1 ]] && INFOPATH=${INFOPATH:+$INFOPATH:}$1
}

function LoadZshEnv() {
    pushd ${zshConfigPath} >/dev/null
    local zshEnv=zshenv_$1
    [ -f ${zshEnv} ] && source ${zshEnv}
    popd >/dev/null
}

case "${OSTYPE}" in
    linux*)
	LoadZshEnv linux
	;;
    darwin*)
	LoadZshEnv macos
	;;
    cygwin*)
	LoadZshEnv cygwin
	;;
esac

localPaths=($(cat <<EOF
$HOME/.pyenv/shims
$HOME/.rbenv/shims
$HOME/bin
EOF
	    ))
for lp in ${localPaths[@]}; do
    AddPriorPath ${lp}
done

unset -f LoadZshEnv
unset localPaths
unset -f AddExtraInfoPath
unset -f AddExtraManPath
unset -f AddExtraPath
unset -f AddPriorPath
