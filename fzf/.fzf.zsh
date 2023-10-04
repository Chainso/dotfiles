# Setup fzf
# ---------

# Find Command
# ---------
export FZF_DEFAULT_COMMAND='fd -H --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"

