export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

alias python3='/opt/homebrew/bin/python3'
alias pip3='/opt/homebrew/bin/pip3'

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
