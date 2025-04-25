# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/temp/.histfile
HISTSIZE=110000
SAVEHIST=100000

# Completion setup
zstyle :compinstall filename '/home/game/.zshrc'
autoload -Uz compinit
compinit

# Add Neovim to PATH
export PATH="$PATH:/opt/nvim/"

# Source Powerlevel10k theme
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# Source plugins
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZDOTDIR/plugins/F-Sy-H/F-Sy-H.plugin.zsh
source $ZDOTDIR/plugins/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Keybindings for zsh-history-substring-search (after sourcing the plugin)
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# # Auto-start tmux in WSL
#
# if [[ -z "$TMUX" && "$TERM_PROGRAM" != "vscode" ]]; then
#     tmux attach-session -t 0 || tmux new-session
# fi
#
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# export JAVA_HOME=/usr/local/java/jdk21
# export PATH=$JAVA_HOME/bin:$PATH
# export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
# export PATH=$JAVA_HOME/bin:$PATH
