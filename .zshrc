test -r ~/.zprofile || return && source ~/.zprofile

export ZSH="/home/frenco/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
