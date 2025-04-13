# Setup fzf
# ---------

# Find Command
# ------------
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fdfind -L -H --strip-cwd-prefix'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"

