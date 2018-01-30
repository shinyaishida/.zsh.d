#
# .zshrc
#
# '.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.
#

zshCommonConfigs=common
zshConfigPrefix=zsh_

function LoadConfiguration() {
    [ x"$1" != x ] && {
	local config=${zshConfigPrefix}$1
	echo "Loading $1"
	source ${config}
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
unset zshConfigPath
