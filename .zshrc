# NAVIGATION

setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# HISTORY

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# ENVIRONMENT
source ~/.config/zsh/.zshenv

# ALIASES
source ~/.config/zsh/.zshalias

eval "$(starship init zsh)"

# ZELLIJ AUTO-START

eval "$(zellij setup --generate-auto-start zsh)"

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh completion
fpath+=~/.config/zsh/plugins/zsh-completions/src
autoload -Uz compinit bashcompinit
compinit
bashcompinit

PATH=~/.console-ninja/.bin:$PATH

# Created by `pipx` on 2024-03-25 09:35:07
export PATH="$PATH:/home/zenix-s/.local/bin"
eval "$(register-python-argcomplete pipx)"

# Load Angular CLI autocompletion.
source <(ng completion script)

# zoxide
eval "$(zoxide init zsh)"

export PATH=$PATH:/home/zenix-s/.spicetify
