# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tt/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tt/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tt/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tt/.fzf/shell/key-bindings.zsh"

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**'

export FZF_DEFAULT_COMMAND='fd --type file --color=always -follow --hidden --exclude .git'

# Options to fzf command
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --border --margin=1 --padding=1"

# ALT-C PREVIEW AS TREE
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || t>"

# FULL PREVIEW USING ?
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind >"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# CTRL-X & CTRL-R TO EXECUTE
# bind "$(bind -s | grep '^"\\C-r"' | sed 's/"/"\\C-x/' | sed 's/"$/\\C-m"/')"

# Use fd (https://github.com/sharkdp/fd) instead of the default find command for
# listing path candidates. - The first argument to the function ($1) is the base
# path to start traversal - See the source code (completion.{bash,zsh}) for the
# details.
_fzf_compgen_path() { fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() { fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function - The first
# argument to the function is the name of the command. - You should make sure to
# pass the rest of the arguments to fzf.
# _fzf_comprun() { local command=$1 shift case "$command" in cd) fzf --preview 'tree
#    -C {} | head -200' "$@" ;; export|unset) fzf --preview "eval 'echo \$'{}" "$@"
#    ;;
#    ssh) fzf --preview 'dig {}' "$@" ;; *) fzf --preview 'bat -n --color=always {}'
#    "$@" ;;
#  esac
# }

#  COLOR SCHEMES
#  ------------

# Dracula
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=dark
# --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
# --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
# '

# xJelly
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
--color info:150,prompt:110,spinner:150,pointer:167,marker:174
'
