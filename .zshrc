# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# enable vim keybinding
bindkey -v

# Vi mode cursor shape
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    # Command mode - block cursor
    echo -ne '\e[1 q'
  else
    # Insert mode - thin/beam cursor
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Ensure beam cursor when starting new prompt
function zle-line-init {
  echo -ne '\e[5 q'
}
zle -N zle-line-init

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Enable Zsh autocompletion
autoload -Uz compinit
compinit

# Enable syntax highlighting with zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Enable autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Enable auto-completion (e.g., zsh-completions)
zinit light zsh-users/zsh-completions

# Powerlevel10k theme for prompt decoration
zinit light romkatv/powerlevel10k

# Enable plugins (e.g., zsh-history-substring-search)
zinit light zsh-users/zsh-history-substring-search
bindkey "^R" history-substring-search-up
bindkey "^S" history-substring-search-down

# You can add any other plugins you'd like below
zinit light zsh-users/zsh-completions

zinit light "junegunn/fzf"

# Enable other useful features
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history
setopt share_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$PATH:$HOME/flutter/bin"
alias ll="ls -lha"
alias vim="nvim"
alias com='cc -Wall -Wextra -Werror *.c'
alias run="./a.out"
alias form="c_formatter_42 **/*.c"
alias norm="norminette -R CheckForbiddenSourceHeader"
alias mini='~/mini-moulinette/mini-moul.sh'

# custom variables, 42 header
alias mini='~/mini-moulinette/mini-moul.sh'
export USER42="smebraht@student.42abudhabi.ae"
export EMAIL42="@42abudhabi.ae"
export SCHOOL42="42 Abu Dhabi"				## example 42/1337 (optional)
