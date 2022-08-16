#
# .zshrc
#
# '.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.
#

fpath=(${zshConfigPath}/functions/*(N-/) $fpath)

autoload -Uz add-zsh-hook

zshCommonConfigs=common
zshConfigPrefix=zsh_

function LoadConfiguration() {
  [ x"$1" != x ] && {
    local config=${zshConfigPrefix}$1
    [ -f ${config} ] && {
      [ ${#1} -lt 8 ] && {
        padding="\t\t"
      } || {
	padding="\t"
      }
      echo -n "Loading $1${padding}"
      source ${config}
      [ $? -eq 0 ] && {
	echo "done"
      } || {
	echo "failed"
      }
    } || {
      echo "Cannot find $1 configuration. Skip it."
    }
  }
}

pushd ${zshConfigPath} >/dev/null
[ -f ${zshCommonConfigs} ] && {
  for config in $(cat ${zshCommonConfigs} 2>/dev/null); do
	LoadConfiguration ${config}
  done
}
popd >/dev/null

unset -f LoadConfiguration
unset zshConfigPrefix
unset zshCommonConfigs

# unset variable defined in zshenv
unset zshConfigPath
