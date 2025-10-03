# Zinit setup
zinit_home="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
[ ! -d "$zinit_home" ] && mkdir -p "$(dirname "$zinit_home")"
[ ! -d "$zinit_home/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$zinit_home"
source "$zinit_home/zinit.zsh"

# Themes
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/amro.omp.json)"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab 

# Add in snippets
#zinit snippet OMZP::git 
#zinit snippet OMZP::autoenv
# Completions
autoload -Uz compinit && compinit -d ~/.cache/zcompdump

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.cache/.zsh_history

setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space
setopt hist_save_no_dups 
setopt hist_ignore_dups 
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={a-za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# Aliases
alias ls='ls --color'
alias nvim='nvim'
alias c='clear'
alias ld='lazydocker'
# Path & tools
export PATH="$PATH:/opt/nvim/"
# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Fuzzy finder (fzf)
eval "$(fzf --zsh)"
#eval "$(zoxide init --cmd cd zsh)"
# sdkman setup
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

