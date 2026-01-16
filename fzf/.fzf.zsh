# Setup fzf
# ---------

# Find Command
# ------------
# Setting fd as the default source for fzf
## Check if 'fdfind' exists, otherwise default to 'fd'
FD_CMD=$(command -v fdfind || command -v fd)

export FZF_DEFAULT_COMMAND="$FD_CMD -L -H --strip-cwd-prefix"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"

