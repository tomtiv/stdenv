# Oh MY ZSH

```shell
sudo apt update
sudo apt install zsh curl git -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y

git clone https://github.com/powerline/fonts.git

cd fonts
.\install.sh

nano ~/.zshrc
ZSH_THEME="blinks half-life cloud dpoggi"
```
ch distribution we are running on
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

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

#function set_prompt(){
#    echo -ne "\033]0; $(basename "$PWD") \007"
#    echo "�"
#}

function set_win_title(){
   # echo -ne "\033]0; YOUR_WINDOW_TITLE_HERE \007"
   echo -ne "\033]0; $(basename "$PWD") \007"
}

starship_precmd_user_func="set_win_title"

 #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1 "

# PATH Variable
# export PATH="$PATH:/home/ansible/.local/bin"
# export PATH="$PATH:/home/xcad/.cargo/bin"

#export PATH=$PATH:$HOME/.cargo/bin:$HOME/.local/bin
export PATH=$PATH:/home/tt/.cargo/bin:/home/tt/.local/bin

export STARSHIP_DISTRO="$ICON "
export STARSHIP_CONFIG="/home/tt/.starship/starship.toml"
eval "$(starship init bash)"

# export PATH="$PATH:/home/xcad/.cargo/bin"
# Source goto
# [[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

#. ~/.node_bashrc
#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

neofetch
```
