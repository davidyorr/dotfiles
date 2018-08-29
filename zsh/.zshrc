# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="sorin"

# Enable plugins.
plugins=(zsh-syntax-highlighting)

# User configuration

source $ZSH/oh-my-zsh.sh
fpath=(~/.zsh/completion $fpath)

export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# npm
export NODE_PATH="$HOME/.npm-global/lib/node_modules"
export PATH="$HOME/.npm-global/bin:$PATH"

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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# history
HISTSIZE=1000000
SAVEHIST=1000000

source "$HOME/.dotfiles/.machine/.zshrc"
