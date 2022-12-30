#
# .zshenv
#
# '.zshenv' is sourced on all invocations of the shell, unless the '-f' option
# is set. It should contain commands to set the command search path, plus other
# important environment variables. '.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.
#

umask 022

function LoadZshEnv() {
  pushd "$HOME/.zsh.d" >/dev/null || {
    echo 'failed to load zshenv'
    return 1
  }
  local zshEnv=zshenv_$1
  [ -f "${zshEnv}" ] && {
    if [ "${#1}" -lt 4 ]; then
      padding='\t\t'
    else
      padding='\t'
    fi
    echo -n "Loading $1 env${padding}"
    # shellcheck disable=SC1090
    if source "${zshEnv}"; then
      echo 'done'
    else
      echo 'failed'
    fi
  }
  popd >/dev/null || {
    echo 'failed to load zshenv'
    return 2
  }
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
