# zplugin
declare -A ZPLGM
ZPLGM[HOME_DIR]=${HOME}/.local/src/zplugin
ZPLGM[BIN_DIR]=${ZPLGM[HOME_DIR]}/bin
ZPLGM[PLUGINS_DIR]=${ZPLGM[HOME_DIR]}/plugins
ZPLGM[COMPLETIONS_DIR]=${ZPLGM[HOME_DIR]}/completions
ZPLGM[SNIPPETS_DIR]=${ZPLGM[HOME_DIR]}/snippets
ZPLGM[SERVICES_DIR]=${ZPLGM[HOME_DIR]}/services

source ${ZPLGM[BIN_DIR]}/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# completion
autoload -Uz compinit
compinit

# PATH
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# npm
export NODE_PATH="$HOME/.npm-global/lib/node_modules"
export PATH="$HOME/.npm-global/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# go stuff
export PATH="/usr/local/go/bin:$PATH"
export GO15VENDOREXPERIMENT=1
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# xclip like pbcopy
if [[ "$(uname)" == "Linux" ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# neovim
alias v='nvim'

alias :q='exit'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# history
HISTSIZE=1000000
SAVEHIST=1000000

source "$HOME/.dotfiles/.machine/.zshrc"
