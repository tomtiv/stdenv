#  _____ _____
# \_   _\_   _\    Thomas Tiveron (tomtiv)
#   | |   | |      http://www.youtube.com/c/tomtiv
#   | |   | |      http://www.gitlab.com/tomtiv/
#   |_|   |_|


zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 7
zstyle :omz:plugins:ssh-agent agent-forwarding yes
#ZSH_TMUX_AUTOSTART_ONCE="true"
#ZSH_TMUX_DEFAULT_SESSION_NAME="deveenv"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export BW_SESSION="3spOXT6uW97dXfYR6BTShG8l0SV1zjONp33ZIhotg3H3bOfZx8qw1UHmx611+QN7Uz2HoSHOzPd9bmBCgqpogQ=="
export LANG=en_US.UTF-8
export FZF_BASE=~/.fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="robbyrussell"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# DONT ADD TO HISTORY
#HISTIGNORE="*secret.server.com*:ytalk*:fortune"
#HISTORY_IGNORE="*secret.server.com*|ytalk*|fortune"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
#	git
	fd
	fzf
	ripgrep
	rsync
#	rust
	thefuck
	zshnotes
	tmux
  ssh-agent
	# dotbare
	# z
	zoxide
	)


# find out which distribution we are running on
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
OS=$_distro

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="";;
    *)                       ICON="";;
esac

export STARSHIP_DISTRO="[$ICON]"
export STARSHIP_CONFIG=~/.config/starship/starship.toml


# DotBare
source ~/.config/dotbare/dotbare.plugin.zsh

# WSL FIX
precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

### Function extract for common file formats ###
IFS=$(echo -en "\n\b")
SAVEIFS=$IFS

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
