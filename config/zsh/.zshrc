# Zsh configuration file (.zshrc) ported from NixOS Home-Manager

# Keybindings and Behavior (initContent)
bindkey -e

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

bindkey '^B' backward-char
bindkey '^F' forward-char
bindkey '^[b' backward-word
bindkey '^[f' forward-word

bindkey '^H' backward-delete-char
bindkey '^D' delete-char
bindkey '^W' backward-kill-word
bindkey '^[d' kill-word

bindkey '^K' kill-line
bindkey '^U' backward-kill-line
bindkey '^Y' yank

bindkey '^T' transpose-chars
bindkey '^L' clear-screen

# Ctrl+Left / Ctrl+Right (word movement)
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[OD' backward-word
bindkey '^[OC' forward-word
bindkey '^[[5D' backward-word
bindkey '^[[5C' forward-word
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

# Alt+Left / Alt+Right
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

# Home / End keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# Delete key
bindkey '^[[3~' delete-char

# Ctrl+Delete
bindkey '^[[3;5~' kill-word

# # Import Wayland environment to systemd for GUI tools (like pinentry-gnome3)
# if [ -n "$WAYLAND_DISPLAY" ]; then
#   systemctl --user import-environment WAYLAND_DISPLAY DISPLAY DBUS_SESSION_BUS_ADDRESS 2>/dev/null
#   dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY DBUS_SESSION_BUS_ADDRESS 2>/dev/null
# fi
export TERM=xterm-256color
export COLORTERM=truecolor

# Automatically start dwm on TTY 1
if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx 2>/dev/null
fi

# Zsh History Configuration
HISTFILE="$HOME/.local/share/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history
setopt extended_history

# Shell Aliases
alias nd="nix develop -c $SHELL"
alias ls="eza --group-directories-first"
alias ll="eza -l --group-directories-first --git"
alias la="eza -la --group-directories-first --git"
alias lt="eza --tree --level=2"
alias cat="bat --paging=never"
alias grep="grep --color=auto"
alias gs="git status -sb"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"
alias ga="git add -A"
alias gm="git add -m"
alias gl="git log --oneline"
alias cleanup="sudo nix-collect-garbage -d"
alias ..="cd .."
alias ...="cd ../.."

# Yazi Shell Wrapper (yazi integration)
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Shell Integrations
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# Zsh Plugins Sourcing
for plugin in \
  /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /run/current-system/sw/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh \
  /run/current-system/sw/share/zsh-history-substring-search/zsh-history-substring-search.zsh \
  /run/current-system/sw/share/fzf-tab/fzf-tab.plugin.zsh \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh \
  /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh \
  /usr/share/fzf-tab/fzf-tab.plugin.zsh; do
  if [ -f "$plugin" ]; then
    source "$plugin"
  fi
done
