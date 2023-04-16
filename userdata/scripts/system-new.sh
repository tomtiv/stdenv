#!/bin/bash

$server_ip = 192.168.0.14
$user_name = 'tt'
$user_email = 'tomtiv@gmail.com'

echo 'Starting Linux System Configuration...\n\n'

echo 'Update System...\n'
sudo apt update && sudo apt upgrade -y

echo "Add New Sudo user...\n"
sudo adduser $user -y
sudo addgroup $user sudo 

su tt

echo 'SSH Key Pair Setup ...\n'

mkdir -p ~/.ssh 
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
cat  ~/linux-systems/configs/identity/ssh/tt.lan/tt-lan-rsa4.Identity.pub >> ~/.ssh/authorized_keys

# Aliases
echo 'Create Bash Aliases ...\n\n'
cp  ~/linux-systems/configs/.bashrc-tt ~/.bashrc -y
cp  ~/linux-systems/configs/.bash_aliases ~/.bash_aliases -y

# App dependencies
echo 'Install System Dependencies ...\n\n'
sudo apt install curl build-essential gcc git net-tools -y
sudo apt install vim neovim -y
sudo apt install python3 pip -y
sudo apt install bat exa fzf fd-find fdupes ripgrep -y
mkdir ~/repos

echo 'Install Rust ... \n'
sudo apt install -y curl \
    gnupg ca-certificates git \
    gcc-multilib g++-multilib cmake libssl-dev pkg-config \
    libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
    libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev
cd ~/repos
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Install Rust Tools ...\n"
rustup component add rls rust-analysis rust-src
rustup component add rustfmt
rustup component add clippy
cargo fmt

cargo install tokei
cargo install procs
cargo install -f --git https://github.com/jez/as-tree

echo 'Adding New Shells ...\n\n'

#https://github.com/oh-my-fish/oh-my-fish
echo 'Installing Fish Shell...\n\n'
sudo apt install fish
cd ~/repos
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# oh-my-zsh

echo 'Installing Emulators ...\n\n'
# alacritty

# https://github.com/junegunn/vim-plug
echo 'Installing NeoVim-Plug ...\n\n'
cd ~/repos
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## https://github.com/neovide/neovide
echo 'Installing NeoVide ...\n\n'
cd ~/repos
git clone "https://github.com/neovide/neovide"
cd neovide && ~/.cargo/bin/cargo build --release
#cp ./target/release/neovide ~/neovide

echo 'Installing Fonts ...\n\n'
cd ~/repos
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hasklig
./install.sh spurce
./install.sh firacode
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hasklig.zip
# wget https://github.com/ryanoasis/nerd-fonts/archive/refs/tags/v2.1.0.zip

echo 'Install SpaceVim...\n'
cd ~/repos
curl -sLf ~https://spacevim.org/install.sh | bash

echo 'Install StartShip Terminal Prompt...\n'
#  curl -fLo "Hasklig Nerd Font Complete.otf" \
    # https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/Hasklig%20Nerd%20Font%20Complete.otf
# curl -fLo "Source Code Nerd Font Complete.otf" \
    # https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/Source%20Code%20Nerd%20Font%20Complete.otf
# bcurl -sLf https://spacevim.org/install.sh | bash

echo 'Finishing up ...\n\n'
sudo apt update && sudo apt upgrade -yes

echo 'exec source .bashrc ...\n'
source .bashrc

echo 'Complated ...\n'
echo 'ALL DONE, ENJOY!\n\n'