# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tt/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tt/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tt/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/tt/.fzf/shell/key-bindings.bash"
