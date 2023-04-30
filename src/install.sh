#!/usr/bin/env bash
#  _____ _____
# \_   _\_   _\    Thomas Tiveron (tomtiv)
#   | |   | |      http://www.youtube.com/c/tomtiv
#   | |   | |      http://www.gitlab.com/tomtiv/
#   |_|   |_|
#
# My zsh config. Not much to see here; just some pretty standard stuff.
# NAME: tomtiv
# DESC: An installation and deployment script for DT's Xmonad desktop.
# WARNING: Run this script at your own risk.
# DEPENDENCIES: libnewt (probably already on the system)

# export NEWT_COLORS="
# root=,blue
# window=,black
# shadow=,blue
# border=blue,black
# title=blue,black
# textbox=blue,black
# radiolist=black,black
# label=black,blue
# checkbox=black,blue
# compactbutton=black,blue
# button=black,red"


if [ "$(id -u)" = 0 ]; then
    echo "##################################################################"
    echo "This script MUST NOT be run as root user since it makes changes"
    echo "to the \$HOME directory of the \$USER executing this script."
    echo "The \$HOME directory of the root user is, of course, '/root'."
    echo "We don't want to mess around in there. So run this script as a"
    echo "normal user. You will be asked for a sudo password when necessary."
    echo "##################################################################"
    exit 1
fi

error() { \
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

sudo apt update && sudo apt upgrade -y

USER=tt

# NEW USER
sudo adduser $user -y
sudo addgroup $user sudo

# Bash Aliases
cp  ~/linux-systems/configs/.bashrc-tt ~/.bashrc -y
cp  ~/linux-systems/configs/.bash_aliases ~/.bash_aliases -y

# Apps & Dependencies
sudo apt install curl git net-tools vim neovim jq tmux -y
sudo apt install batcat ranger exa fzf fd-find fdupes ripgrep tldr thefuck -y
sudo apt update && sudo apt upgrade -y

# DEV APS
sudo apt install build-essential make gcc -y
sudo apt install python3 pip -y
sudo apt update && sudo apt upgrade -y

# bin  aliases
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/tldr
mkdir -p ~/.local/share/font
mkdir -p ~/.local/bin/dotbare

ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s /usr/bin/fd-find ~/.local/bin/fd

# ZSHSHELL
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# CUSTOMIZED PROMPTS
curl -sS https://starship.rs/install.sh | sh
echo eval "$(starship init bash)" >> ~/.bashrc
echo eval "$(starship init zsh)" >> ~/.zshrc

# https://github.com/junegunn/vim-plug
echo 'Installing NeoVim-Plug ...\n\n'
cd ~/repos
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


##########################
# Install Rust
###########################

# echo 'Install Rust ... \n'
# sudo apt install -y curl \
#     gnupg ca-certificates git \
#     gcc-multilib g++-multilib cmake libssl-dev pkg-config \
#     libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
#     libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev
# cd ~/repos

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# echo "Install Rust Tools ...\n"
# rustup component add rls rust-analysis rust-src
# rustup component add rustfmt
# rustup component add clippy
# cargo fmt
# rustup component add rls rust-analysis rust-src
# rustup component add rustfmt

# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_COMMAND='fd --type file --color=always -follow --hidden --exclude .git'
# export FZF_DEFAULT_OPTS="--ansi"
