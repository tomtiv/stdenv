# if user is not root, pass all commands via sudo #
# if [ $UID -ne 0 ]; then
    # alias reboot='sudo reboot'
    # alias uu='sudo apt update && sudo apt upgrade -y'
#    alias nano='sudo nano'
#fi

# DOCKER
dcu='docker-compose up -d --force-recreate'
dcl='docker ps -a'

# mycommand() {
#   command1 -y ppp "${1}.mp3" -i rrr - | command2 --text "$1" --ssss -
# }

# FILE OPERATORS
alias fde='fd --extension'
alias fdt="fd --extension rs | as-tree"
alias fz="fzf --preview 'bat --style numbers, changes color=always {}'"
alias fzn="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias mkp='mkdir -pv'
#alias mkd='mkdir -p'

# LS ALIASES
alias ls='exa -abhlg --icons --group-directories-first'
alias l='exa -abhlg --icons --group-directories-first --no-time --no-permissions'
alias lm='exa -abhlg --icons --group-directories-first --no-time --no-permissions --tree --level=2'
alias ls='exa'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'

#  GIT
alias gc='git clone'
alias gs='git status'

# SHELL
alias bre='nano ~/.bashrc'
alias bra='nano ~/.bash_aliases'
alias sbr='source ~/.bashrc'
alias zrc='nano ~/.zshrc'
alias szr='source ~/.zshhrc'
alias ste='nano ~/.config/starship.toml'

alias psa='ps auxw'
alias nst='netstat -tolpn'
alias trt='tar xvf'
alias btop='bpytop'
alias htop='htop'
alias top='htop'

# ID
alias users="awk -F: '{ print }' /etc/passwd"
alias groups="awk -F: '{ print }' /etc/passwd"
alias up="awk -F ':' '{print $1}' /etc/passwd"
alias ug="awk -F ':' '{print $1}' /etc/group"

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
