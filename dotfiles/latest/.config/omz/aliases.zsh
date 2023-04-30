# Alias
# ---
#
# alias k="kubectl"
# alias h="helm"
# alias tf="terraform"
# alias a="ansible"
# alias ap="ansible-playbook"
# alias dt="datree"

# mac OS shortcuts
alias code="open -a 'Visual Studio Code'"



# ALIAS COMMANDS
# alias ls="exa --icons --group-directories-first"
# alias ll="exa --icons --group-directories-first -l"
alias g="goto"
alias grep='grep --color'

alias cbp="code /home/xcad/obsidianvault/boilerplates"
alias cpr="code /home/xcad/obsidianvault/projects"

alias dcu="docker-compose up -d --force-recreate"
alias dcl='docker ps -a'


# FILE OPERATORS
# alias fdt="fd | as-tree"
alias fz="fzf --preview 'bat --style numbers, changes color=always {}'"
alias fz5="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias bat='batcat'
alias cat='batcat'

# LS ALIASES
# alias ls='exa -abhlg --icons --group-directories-first'
# alias l='exa -abhlg --icons --group-directories-first --no-time --no-permissions'
# alias lt='exa -abhlg --icons --group-directories-first --no-time --no-permissions --tree --level=2'
# alias ls='exa'


alias -s md=vim
alias -s txt=vim
alias -s js=vim
alias -s json=code
alias -s yml=vim
alias -s yaml=vim

alias -g l='ls -la'
alias -g ddl='docker ps -a'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# # git
# alias addup='git add -u'
# alias addall='git add .'
# alias branch='git branch'
# alias checkout='git checkout'
# alias clone='git clone'
# alias commit='git commit -m'
# alias fetch='git fetch'
# alias pull='git pull origin'
# alias push='git push origin'
# alias stat='git status'  # 'status' is protected name so using 'stat' instead
# alias tag='git tag'
# alias newtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#  GIT
# alias gc='git clone'
# alias gs='git status'

# SHELL
alias bre='nano ~/.bashrc'
alias bra='nano ~/.bash_aliases'
alias sbr='source ~/.bashrc'
alias ezh='nano ~/.zshrc'
alias eza='vim ~/.oh-my-zsh/custom/tt-aliases.zsh'
# alias szh='source ~/.zshhrc'
alias ste='nano ~/.config/starship/starship.toml'

# ID
alias users="awk -F: '{ print }' /etc/passwd"
alias groups="awk -F: '{ print }' /etc/passwd"
alias upp="awk -F ':' '{print $1}' /etc/passwd"
alias ugg="awk -F ':' '{print $1}' /etc/group"

# NETWORK
alias mount='mount |column -t'
alias ports='netstat -tulanp'
alias ping='ping -c 5'
alias fping='ping -c 100 -s.2'

# SYSMON
alias cpi='lscpu'                                           # Get server cpu info
alias fmem='free -m -l -t'                                  # Pass options to free
alias psm='ps auxf | sort -nr -k 4'                         # top process eating memory
alias psmm='ps auxf | sort -nr -k 4 | head -10'             # 10 top process eating memory
alias psc='ps auxf | sort -nr -k 3'                         # top process eating cpu
alias pscc='ps auxf | sort -nr -k 3 | head -10'             # 10 top process eating cpu
alias cpii='less /proc/cpuinfo'                             # Older system use /proc/cpuinfo
alias gpi='grep -i --color memory /var/log/Xorg.0.log'      # GPU ram on desktop / laptop

alias psa='ps auxw'
alias nst='netstat -tolpn'
alias trt='tar xvf'
alias btop='bpytop'
alias htop='htop'
alias top='htop'

# COMMON
alias na="sudo nano --tabstospaces --linenumbers --indicator --stateflags --backupdir='~/.local/nano/' --backup --autoindent --minibar --positionlog"
alias uu='sudo apt update && sudo apt upgrade -y'
alias c='clear'
alias path='echo -e ${PATH//:/\\n}'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
alias h='history'
alias j='jobs -l'

# PYTHON
alias python='python3'
alias pip='pip3'
