#######################
# VARIABLES

# true | false
ZOXIDE="true"
# starship | oh-my-posh | none
PROMPT_SHELL="starship"

#######################
# ENVIRONMENT

export CONFIG_HOME="$HOME/.config"
export DATA_HOME="$HOME/.local/share"
export CACHE_HOME="$HOME/.cache"

export ZSHDOTDIR="$CONFIG_HOME/zsh"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export dev="$HOME/Development"
export dotfiles="$HOME/dotfiles"
export vault="$HOME/Git_Vault"

export PATH="$HOME/.local/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"

#######################
# ZSH OPTIONS

# Directory navigation
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt cdable_vars

# Spelling correction
setopt correct

# History
setopt share_history
setopt append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_verify
setopt extended_history

# Globbing
setopt extended_glob

#######################
# COMPLETION

fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit
autoload -Uz colors && colors

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
_comp_options+=(globdots)

#######################
# KEYBINDINGS

bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

#######################
# ALIASES

alias dir='dir --color=auto'
alias gflags='gcc -Wall -Wextra -Werror'
alias c-format="$HOME/.local/bin/c_formatter_42"

# Navigation
if [ "$ZOXIDE" = "true" ] && command -v zoxide &>/dev/null; then
  alias cd='z'
  alias ..='z ..'
  alias ...='z ../..'
  alias ....='z ../../..'
  alias .....='z ../../../..'
  alias ......='z ../../../../..'
else
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias .....='cd ../../../..'
  alias ......='cd ../../../../..'
fi

# Git
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gu="git pull"
alias gl="git log --oneline --graph --decorate"
alias gs="git status --short"
alias gb="git branch"
alias gi="git init"
alias gco="git checkout"
alias gcl="git clone"

#######################
# FUNCTIONS

function l() {
  ls -al --color=always "${1:-.}"
}

function gitc() {
  echo -n "Commit header: "
  read header
  echo -n "Commit body: "
  read body
  git commit -m "$header" -m "$body"
  echo "Commit done."
}

#######################
# TOOLS INIT

# Starship / Oh My Posh
case "$PROMPT_SHELL" in
  "starship")
    if command -v starship &>/dev/null; then
      eval "$(starship init zsh)"
    else
      echo "starship not installed, skipping prompt init."
    fi
    ;;
  "oh-my-posh")
    if command -v oh-my-posh &>/dev/null; then
      eval "$(oh-my-posh init zsh --config "$CONFIG_HOME/oh_my_posh/amro.omp.toml")"
    else
      echo "oh-my-posh not installed, skipping prompt init."
    fi
    ;;
  "none") ;;
  *)
    echo "Unknown prompt type: $PROMPT_SHELL"
    ;;
esac

# FZF
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi

# Zoxide
if [ "$ZOXIDE" = "true" ] && command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

export PATH=$PATH:/home/sergioffdev/.spicetify
