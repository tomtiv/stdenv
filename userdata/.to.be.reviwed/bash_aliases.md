# USEFUL BASH ALIASES

```shell
# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt update'
    alias upgrade='sudo apt upgrade'
    alias nano='sudo nano'
fi

alias uu='sudo apt update && sudo apt upgrade -y'
alias sudp-'sudo'

alias bre='nano ~/.bashrc'
alias bre='nano ~/bash_aliasess'
alias sbr='source .bashrc'

alias pikiss='/home/pi/piKiss/piKiss.sh'

alias zrc='nano ~/.zshrc'
alias zbrc='source .zshhrc'

alias strn='nano ~/.starship/starship.toml'

alias cls='clear'

## some more ls aliases
alias lm='ls -la'
alias l.='ls -d .* --color=auto'                # Show hidden files
alias cd..='cd ..'
alias ..='cd ..'
# alias ...='cd ../../../'
# alias ....='cd ../../../../'
# alias .....='cd ../../../../'

alias psa='ps auxw'
alias nst='netstat -tolpn'
alias trt='tar xvf '

# passwords
alias upass="awk -F: '{ print }' /etc/passwd"
# alias upw="awk -F ":" '{print $1}' /etc/passwd"

# Date & Time
alias now='date +"%T"'
alias now-time=now
alias now-date='date +"%d-%m-%Y"'

alias path='echo -e ${PATH//:/\\n}'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
alias top='atop'
alias h='history'
alias j='jobs -l'


#/usr/bin/fdfind


# FILE OPERATORS
alias fdt="fd --extension rs | as-tree"
alias fbat="fzf --preview 'batcat --style numbers, changes color=always {}'"
alias fbc="fzf --preview 'batcat --color=always --style=numbers --line-range=:500 {}'"
alias bat='batcat'
alias cat='batcat -all'
alias mkd='mkdir -pv'

# Network
alias ports='netstat -tulanp'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias mount='mount |column -t'
alias mntnas='mount |column -t'

# SYSTEM MONITORING
alias cpuinfo='lscpu'                                           # Get server cpu info
alias meminfo='free -m -l -t'                                   # Pass options to free
alias psmem='ps auxf | sort -nr -k 4'                           # top process eating memory
alias psmem10='ps auxf | sort -nr -k 4 | head -10'              # 10 top process eating memory
alias pscpu='ps auxf | sort -nr -k 3'                           # top process eating cpu
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'              # 10 top process eating cpu
alias cpuinfo2='less /proc/cpuinfo'                             # Older system use /proc/cpuinfo
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'   # GPU ram on desktop / laptop

alias ngrl='sudo /usr/local/nginx/sbin/nginx -s reload'         # Restart nginx

#  GIT
alias gcl='sudo git clone '

# PYTHON
alias python='python3'
alias pip='pip3'

#`_myos="$(uname)"`
 alias mcdstats='/usr/bin/memcached-tool 10.10.27.11:11211 stats'
 alias mcdshow='/usr/bin/memcached-tool 10.10.27.11:11211 display'

# Magic Mirror
alias mmst='pm2 start ./mm.sh --watch --update-env'
alias mmsp='pm2 stop mm'
alias mmrs='pm2 restart mm --watch --update-env'
alias mmjs='sudo nano ~/MagicMirror/config/config.js'
alias mmcs='sudo nano ~/MagicMirror/css/custom.css'

## GITLAB
alias gle='sudo nano /etc/gitlab/gitlab.rb'
alias glir='sudo gitlab-ctl reconfigure'
alias glis='sudo gitlab-ctl status'
alias gli='sudo  gitlab-ctl '
alias gsrv='sudo systemctl restart gitlab-runsvdir'
```


