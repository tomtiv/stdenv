#!/usr/bin/env bash
#  _________ ______ _________
# \___   ___/___   \___  ___/   Thomas Tiveron (t2tech)
#    |  |       )  )  |  |      http://www.github.com/t2tech
#    |  |     /   /   |  |      http://www.gitlab.com/t2tech
#    |  |   /   /__   |  |
#    |__|  /_______|  |__|
#
#  _________ ______ _________
# \___   ___/___   \___  ___/   Thomas Tiveron (t2tech)
#    |  |       )  )  |  |      http://www.github.com/t2tech
#    |  |     /   /   |  |      http://www.gitlab.com/t2tech
#    |  |   /   /__   |  |
#    |__|  /_______|  |__|
#
# NAME: t2tech
# DESC: Automating new linux box
# WARNING: Run this script at your own risk.
# DEPENDENCIES: 
#

YW=`echo "\033[33m"`
BL=`echo "\033[36m"`
RD=`echo "\033[01;31m"`
CM='\xE2\x9C\x94\033'
GN=`echo "\033[1;92m"`
CL=`echo "\033[m"`

function display_header {
    cat << "_EOF_"
       _,.
     ,` -.)
    '( _/'-\\-.               
   /,|`--._,-^|            ,     _________ _____ ________
   \_| |`-._/||          ,'|     \__   __/___   \__   __/  
     |  `-, / |         /  /        |  |     )  )  |  |
     |     || |        /  /         |  |    /   /  |  |
      `r-._||/   __   /  /          |  |  /   /__  |  |
  __,-<_     )`-/  `./  /           |__| /_______| |__|
 |  \   `---'   \   /  / 
 |   |           |./  /  
 |   /           //  /     
 \_/' \         |/  /         
  |    |   _,^-'/  /              
  |    , ``  (\/  /_        
   \,.->._    \X-=/^         
   (  /   `-._//^`  
    `Y-.____(__}              
     |     {__)           
           ()`     
_EOF_
}

function header_info {
  echo -e "${RD}
 _________ _____ ________
 \__   __/___   \__   __/
   |  |      )  )  |  |
   |  |    /   /   |  |
   |  |  /   /__   |  |
   |__| /_______|  |__|
  
  ${CL}"
}

set -e
tput civis

# DEFIN DEFAULT VALUES
START_TIME="$(date)"
END_TIME=""

# DEFFAULT USER SETTINGS
USER_NAME="tt"
USER_PASS="tt"
USER_PASS_CONFIRM="tt"
USER_EMAIL=user@gexample.com
USER_SSH_PUB_KEY=NEW
CURRENT_IP=192.168.0.50
SSH_KEY_STORE="/.ssh/.authorizedkeys"

function sysprep_fn() {
  #> /dev/null 2>&1
  echo ' Starting System Configuration ... '
  echo ' Checking for Updates ... '
  sudo apt update && sudo apt upgrade -y # > /dev/null
  echo " Creating $USER_NAME and granting sudo permissions ... "
  sudo adduser $USER_NAME  # > /dev/null
  sudo addgroup $USER_NAME sudo # > /dev/null
  su $USER_NAME  # > /dev/null 2>&1

  # Aliases
  echo ' Adding useful Bash Aliases ... '
  # cp ~/.bashrc ~/.bashrc_old
  cp ~/.bash_aliases ~/.bash_aliases_bk
  #cp ~/devops/sysdeploy/linux/configs/.bashrc-tt  ~/.bashrc 
  cp ~/devops/sysdeploy/linux/configs/.bash_aliases  ~/.bash_aliases
  

  # App dependencies
  echo ' Adding System Dependencies ... '
  sudo apt update && sudo apt upgrade -y
  sudo apt install curl build-essential gcc git net-tools htop colordiff locate -y
  sudo apt install vim neovim -y
  sudo apt install python3 pip -y
  sudo apt install bat exa fzf fd-find fdupes ripgrep -y

  # mkdir ~/repos
}

function ssh_fn() {

  echo ' SSH Key Pair Setup ... '
  mkdir -p ~/.ssh && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

  # create ssh key-pair
  #TODO

  # IMPORT SSH KEY
  cat  ~/linux-systems/configs/identity/ssh/tt.lan/tt-lan-rsa4.Identity.pub >> ~/.ssh/authorized_keys
  cat /mnt/d/.dat/ssh/global/tt_4096_rsa_id.pub >> ~/.ssh/authorized_keys
}

function shell_fn() {
echo ' Adding Shells ... '

## Show available shells
#echo ""
#cat /etc/Shells 

# https://github.com/oh-my-fish/oh-my-fish
echo ' Installing Fish Shell ... '
sudo apt install fish
cd ~/repos
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Oh MY ZSH
echo ' Install oh-my-zsh '
sudo apt update
sudo apt install zsh curl git -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y
nano ~/.zshrc
ZSH_THEME="blinks half-life cloud dpoggi"
}

function emulators_fn() {
  echo ' Installing Emulators ... '
  # alacritty

  # https://github.com/junegunn/vim-plug
  echo ' Installing NeoVim-Plug ... '
  cd ~/repos
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  # # https://github.com/neovide/neovide
  # echo ' Installing NeoVide ... '
  # cd ~/repos
  # git clone "https://github.com/neovide/neovide"
  # cd neovide && ~/.cargo/bin/cargo build --release
  # # cp ./target/release/neovide ~/neovide

  echo ' Adding Required Fonts ... '
  cd ~/repos/fonts

  git clone https://github.com/powerline/fonts.git 
  cd /powerline
  .\install.sh

  git clone https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts
  ./install.sh Hasklig
  ./install.sh spurce
  ./install.sh firacode
  # wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hasklig.zip
  # wget https://github.com/ryanoasis/nerd-fonts/archive/refs/tags/v2.1.0.zip

  # echo ' Install SpaceVim ... '
  # cd ~/repos
  # curl -sLf ~https://spacevim.org/install.sh | bash

  # echo ' Install StartShip Terminal Prompt ... '
  #  curl -fLo "Hasklig Nerd Font Complete.otf" \
      # https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/Hasklig%20Nerd%20Font%20Complete.otf
  # curl -fLo "Source Code Nerd Font Complete.otf" \
      # https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/Source%20Code%20Nerd%20Font%20Complete.otf
  # bcurl -sLf https://spacevim.org/install.sh | bash
} # emulators_fn

# FUNCTIONS DEFINITIONS

function rust_fn {
  echo ' Install Rust ... '
  sudo apt install -y curl \
      gnupg ca-certificates git \
      gcc-multilib g++-multilib cmake libssl-dev pkg-config \
      libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
      libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev
  cd ~/repos
  
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  echo " Install Rust Tools ... "
  rustup component add rls rust-analysis rust-src
  rustup component add rustfmt
  rustup component add clippy
  
  cargo fmt
  cargo install tokei
  cargo install procs
  cargo install -f --git https://github.com/jez/as-tree
  
  # src: https://github.com/Peltoche/lsd
  cargo install lsd
  echo " Installed Rust Succesfully ... "
}

function deploy_fn {
  sysprep_fn
  # rust_fn
  # shell_fn
  # emulators_fn
  cleanup_fn
}

function deploy_tt_fn {
  # MY USER INFO
  USER_NAME=tt
  TT_USER_PASS=tt
  TT_USER_PASS_CONFIRM=tt
  TT_USER_EMAIL=tomtiv@gmail.com
  #TT_USER_SSH_PUB_KEY=''
}

function custom_fn() {
  while true; do
    clear
    echo "  "
    echo " **************************************** "
    echo " Enter your info for custom configuration "
    echo " **************************************** "
    read -p "  login: " USER_NAME
    read -p "  password: " USER_PASS
    read -p "  confirm password: " USER_PASS_CONFIRM  
    read -p "  email: " USER_EMAIL
    read -p "  ssh public key (new if blank): " USER_SSH_PUB_KEY
    echo " "

    read -p " Accept? (y\n or 0 to exit)" yn
    case "$yn" in
        [Yy]* ) break;;
        [Nn]* ) custom_fn;;
        [0]* )  main_cmd;;
        * ) echo " valid Options are [y\n\0] ";;
    esac
  done
  deploy_fn
}

function show_defaults_fn() {
  echo " Defaults "
  echo " ********** "
  echo " login: $USER_NAME "
  echo " password: $USER_PASS "
  echo " confirm password: $USER_PASS_CONFIRM "
  echo " email: $USER_EMAIL "
  echo " ssh public key (new if blank): $USER_SSH_PUB_KEY "
  echo " ssh public key: $USER_SSH_KEY_STORE "
}

function show_menu_fn() {
  # DEFFAULT USER SETTINGS
  echo " "  
  show_defaults_fn
  echo " "
  echo " a) TT Deployment "
  echo " 1) Deploy Using Default Values"
  echo " 2) Deploy Using Custom Values"
  echo " 0) Quit"
  echo " "  
}

function show_banner_fn() {
  clear
  header_info
}

function main_fn() {
  show_banner_fn
  show_menu_fn
    while true; do
  show_banner_fn
  show_menu_fn    
    read -p " Make a choice: " ANSWER
    case "$ANSWER" in
        [a]* ) deploy_tt_fn;;    
        [1]* ) deploy_fn;;
        [2]* ) custom_fn;;
        [0]* ) exit;;
        * ) echo " Valid Options are 1, 2, 0 ";;
    esac
  done
}

function cleanup_fn {
  echo ' Doing some clean up ... '
  echo ' trying to apply system updates ...'
  sudo apt update && sudo apt upgrade -yes
  echo ' The current shell need to be reloaded ...'
  echo ' trying to relosd shell ...'
  source .bashrc
  echo 'No errors detected, all done ... '
}

function help_fn() {
    cat _EOF_
    echo " USAGE: systeminit [options] [-u|e|p|c|s|h ] "
    echo " -u"
    echo " -e"
    echo " -p"
    echo " -c"
    echo " -s"
    echo " -h shows this messgae "
    echo " "
    _EOF_
    end
}

function quit_fn() {
    echo " press a key to exit "
    read -n 1 -s
    exit
}

# EXECUTION

# Validate FLags
while getopts uihp:c: flag; do
    case "${flag}" in
        u) USER_NAME=${OPTARG};;
        e) USER_EMAIL=${OPTARG};;
        p) USER_PASS=${OPTARG};;
        c) USER_PASS_CONFIRM=${OPTARG};;
        s) USER_SSH_PUB_KEY=${OPTARG};;
        i) CURRENT_IP=${OPTARG};;
        h) help_fn;;
        \?) # Invalid option
        echo " use --help  "
        exit;;
    esac
done

main_fn
end


##############################
# Process the input options. #
##############################
# Get the options
# while getopts ":h" option; do
#    case $option in
#       h) # display Help
#          Help
#          exit;;
#      \?) # Invalid option
#          echo "Error: Invalid option"
#          exit;;
#    esac
# done


# # set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/bin" ] ; then
#     PATH="$HOME/bin:$PATH"
# fi

# showmenu_fn() {
#     printf "    ${YW} 1)${YW} Privileged ${CL}\n"
#     printf "    ${YW} 2)${GN} Unprivileged ${CL}\n"

#     printf "Please choose a Install Method and hit enter or ${RD}x${CL} to exit."
#     read opt
# }

# function selected_fn() {
#     message1=${@:-"${CL}Error: No message passed"}
#     printf " ${YW}${message1}${CL}\n"
# }

# while true; do
#     read -p "This will create a New Adguard Home LXC. Proceed(y/n)?" yn
#     case $yn in
#         [Yy]* ) break;;
#         [Nn]* ) exit;;
#         * ) echo "Please answer yes or no.";;
#     esac
# done