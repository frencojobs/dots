test -r ~/.zprofile || return && source ~/.zprofile

if [ "$TMUX" = "" ]; then tmux; fi

export ZSH="/home/frenco/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git)
plugins=(zsh-autosuggestions)

# starship
eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "/home/frenco/.ghcup/env" ] && source "/home/frenco/.ghcup/env" # ghcup-env

