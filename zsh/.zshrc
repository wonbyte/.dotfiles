# load antigen
source /usr/local/share/antigen/antigen.zsh

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# load antigen configurations
antigen init ~/.antigenrc

# aliases
alias clr="clear"
alias hist="history | less"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# exports
path=(~/.local/bin $path)
export PATH

export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
export DOTFILES=$HOME/.dotfiles
export VAULT_ADDR=https://prod.vault.conde.io:443
