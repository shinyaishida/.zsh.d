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

unset -f LoadZshEnv
