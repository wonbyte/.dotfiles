# load antigen
source /usr/local/share/antigen/antigen.zsh

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# load antigen configurations
antigen init ~/.antigenrc

# ensures all previous lines matching the current command are removed from history before the current command is saved.
setopt HIST_IGNORE_ALL_DUPS

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
