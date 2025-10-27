export TERM=xterm-256color
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# To customize prompt, run `p10k configure` or edit ~/projects/dotfiles/.p10k.zsh.
[[ ! -f ~/projects/dotfiles/.p10k.zsh ]] || source ~/projects/dotfiles/.p10k.zsh

# Add in snippets
# zinit snippet OMZL::git.zsh
# zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
# zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"

# Aliases
alias ll='ls -la --color'
alias grep='grep --color'
alias vim='nvim'
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range=:500 {} || head -n 500 {}'"
alias com="cc -Wall -Werror -Wextra"
alias form="c_formatter_42 **/*.c"
alias norm="norminette . -R CheckForbiddenSourceHeader"
alias taskmaster='task-master'
alias tm='task-master'

alias mini='~/mini-moulinette/mini-moul.sh'
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export QT_QPA_PLATFORM=xcb

export ANDROID_HOME="$HOME/Android/Sdk/"
export FLUTTER_HOME="$HOME/flutter/"

export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator/"
export PATH="$PATH:$FLUTTER_HOME/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

source /usr/share/nvm/init-nvm.sh
