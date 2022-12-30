#
# .zshrc
#
# '.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.
#

autoload -Uz add-zsh-hook

zshCommonConfigs=common
zshConfigPrefix=zsh_

function LoadConfiguration() {
  if [ x"$1" != x ]; then
    local config=${zshConfigPrefix}$1
    if [ -f "${config}" ]; then
      if [ "${#1}" -lt 8 ]; then
        padding='\t\t'
      else
        padding='\t'
      fi
      echo -n "Loading $1${padding}"
      # shellcheck disable=SC1090
      if source "${config}"; then
        echo 'done'
      else
        echo 'failed'
      fi
    else
      echo "Cannot find $1 configuration. Skip it."
    fi
  fi
}

pushd "$HOME/.zsh.d" >/dev/null || exit 1
if [ -f ${zshCommonConfigs} ]; then
  # shellcheck disable=SC2013
  # read the content word by word
  for config in $(cat "${zshCommonConfigs}" 2>/dev/null); do
    LoadConfiguration "${config}"
  done
fi
popd >/dev/null || exit 2

unset -f LoadConfiguration
unset zshConfigPrefix
unset zshCommonConfigs
