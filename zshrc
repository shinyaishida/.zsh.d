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

pushd ${zshConfigPath} >/dev/null
[ -f ${zshCommonConfigs} ] && {
    for config in $(cat ${zshCommonConfigs} 2>/dev/null); do
	LoadConfiguration ${config}
    done
}
popd >/dev/null

unset -f AddExtraInfoPath
unset -f AddExtraManPath
unset -f AddExtraPath
unset -f AddPriorPath
unset -f LoadConfiguration
unset zshConfigPrefix
unset zshCommonConfigs
unset zshConfigPath
