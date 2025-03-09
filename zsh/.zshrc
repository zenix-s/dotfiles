#######################
#######################
# VARIABLES SECTION

# true false
ZOXIDE="true"
# starship | oh-my-posh | none
PROMPT_SHELL="starship"

#######################
#######################
# CONFIGURATION SECTION

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

#######################
#######################
# ENVIRONMENT SECTION
export CONFIG_HOME="$HOME/.config"
export DATA_HOME="$CONFIG_HOME/local/share"
export CACHE_HOME="$CONFIG_HOME/cache"

export ZSHDOTDIR="$CONFIG_HOME/zsh"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#export VISUAL="nvim"
#export EDITOR="nvim"

export dev="$HOME/Development"
export dotfiles="$HOME/dotfiles"
export vault="$HOME/Git_Vault"

#######################
#######################
# ALIASES SECTION

function l() {
  if [ -z "$1" ]; then
    if command -v exa &> /dev/null; then
      exa -al --color=always  --header --group-directories-first --icons
    else
      ls -al --color=always
    fi
  else
    if command -v exa &> /dev/null; then
      exa -al --color=always  --header --group-directories-first --icons $1
    else
      ls -al --color=always $1
    fi
  fi
}

# C compiler
alias gflags='gcc -Wall -Wextra -Werror'

if [ "$ZOXIDE" = "true" ] && command -v z &> /dev/null; then
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

alias dir='dir --color=auto'

# git
function gitc()
{
  echo -n "Introduce el header del commit: \n"
  read header

  echo -n "Introduce el body del commit: \n"
  read body

  git add .
  git commit -m "$header" -m "$body"

  echo "Commit realizado con éxito"
}

alias set_42_header='~/.dotfiles/inject_42h_linux_x86_64'

#######################
#######################
# ZSH CONFIGURATION

# Navegación de directorios
setopt auto_cd              # Permite cambiar de directorio sin usar 'cd'
setopt auto_pushd           # Usa 'pushd' implícitamente en lugar de 'cd'
setopt pushd_ignore_dups    # Evita duplicar directorios en la pila de pushd
setopt pushd_silent         # Silencia la salida de 'pushd' y 'popd'
setopt cdable_vars          # Permite usar variables como rutas con 'cd'

# Corrección de errores
setopt correct              # Habilita la corrección ortográfica de comandos

# Historial de comandos
setopt SHARE_HISTORY
setopt appendhistory        # Añade los comandos al historial al final de la sesión
setopt sharehistory         # Comparte el historial entre las sesiones del shell
setopt hist_ignore_space    # No guarda los comandos que empiezan con un espacio
setopt hist_ignore_all_dups # No guarda los comandos duplicados en todo el historial
setopt hist_save_no_dups    # No guarda duplicados consecutivos en el historial
setopt hist_ignore_dups     # No guarda los comandos duplicados consecutivos en el historial
setopt hist_find_no_dups    # No busca duplicados en el historial
setopt hist_verify          # Muestra el comando antes de ejecutarlo para confirmación
setopt extended_history     # Guarda información adicional en el historial (como la duración y la fecha de los comandos)

# Expansión y coincidencia de patrones
setopt extended_glob        # Habilita la coincidencia de patrones avanzada (extended globbing)


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab

# Add in zsh
zinit snippet OMZP::git
zinit snippet OMZP::archlinux
zinit snippet OMZP::asdf



autoload -Uz compinit && compinit
autoload -Uz colors && colors

zinit cdreplay -q


bindkey '^k' history-search-backward
bindkey '^j' history-search-forward


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
_comp_options+=(globdots)

# zstyle ':completion:*' menu no zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# STARSHIP
case "$PROMPT_SHELL" in
  "starship")
    if [ -x "$(command -v starship)" ]; then
      eval "$(starship init zsh)"
    else
      echo "Starship no está instalado, no se puede inicializar."
    fi
    ;;
  "oh-my-posh")
    if [ -x "$(command -v ~/Apps/my_posh/oh-my-posh)" ]; then
      eval "$(~/Apps/my_posh/oh-my-posh init zsh --config ~/.config/oh_my_posh/amro.omp.toml)"
    else
      echo "Oh My Posh no está instalado, no se puede inicializar."
    fi
    ;;
  "none")
    ;;
  *)
    echo "Tipo de prompt no reconocido: $PROMPT_TYPE"
    ;;
esac

# FZF
if [ -x "$(command -v fzf)" ]; then
  eval "$(fzf --zsh)"
fi

# ZOXIDE
if [ "$ZOXIDE" = "true" ] && [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
fi


# ANGULAR CLI
# source <(ng completion script)

# ZELLIJ
# eval "$(zellij setup --generate-auto-start zsh)"

# CONSOLE NINJA
PATH=~/.console-ninja/.bin:$PATH

# PIPX
# export PATH="$PATH:/home/sergioffdev/.local/bin"
# eval "$(register-python-argcomplete pipx)"
alias c-format="~/.local/bin/c_formatter_42"

# Created by `pipx` on 2024-07-16 16:15:05
export PATH="$PATH:/home/sergioff/.local/bin"

# Created by `pipx` on 2024-12-31 17:36:55
export PATH="$PATH:/home/zenix-dev/.local/bin"

export PATH=$PATH:/home/zenix-dev/.spicetify
