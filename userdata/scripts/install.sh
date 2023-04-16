cd existing_repo
git remote add origin https://gl.tomtiv.me/tt/dotfiles.git
git branch -M origin
git push -uf origin origin

# STANDARDIZE ENVIRONMENT

## TABLE OF CONTENTS

### USERS & GROUPS

```bash

- system user
sudo adduser cman
sudo addgroup cman sudo

- docker user
sudo adduser docman
sudo addgroup docman sudo docker

- defult user
sudo adduser tt
sudo addgroup tt sudo docker

su tt
echo tt

```
### GIT

```bash
git credential-manager
git config user.name "tt"
git config user.name
git config user.email "tomtiv@gmail.com"
git config user.email
git config --get gl.tomtiv.me
```

### SSH

ssh-keygen -t rsa -b 4096 -f ~/.ssh/tt_id_rsa
ssh-copy-id -i tt_id_rsa -p 22 tt@192.168.0.
ssh-keyscan -p 4422 192.168.0.
ssh -T -p 22 tt@192.168.0.

### CLI TOOLS

```bash
apt update && sudo apt upgrade -y

- Useablity
apt install git credential-manager
apt install fzf exa fdfind ripgrep batcat tldr thefuck fzf ranger neovim tmux gdu unzip -y
apt install bash-completion dotbare
apt install bpytop neofetch cpufetch 

- Dev Tools
apt install gcc make git jq
```

### RUST

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rls rust-analysis rust-src
rustup component add rustfmt
cargo install ripgrep
cargo fmt
```
### STARSHIP

```bash
curl -sS https://starship.rs/install.sh | sh

echo eval "$(starship init bash)" >> ./.bashrc
```

### LOCALES

```bash
locale -a
update-locale LANG=LANG=en_US.UTF-8 LANGUAGE
update-locale LANG=Lsudo localectl set-locale LANG=en_IN.UTF-8ANG=en_US.UTF-8 LANGUAGE
update-locale LANG=en_US.UTF-8 LANGUAGE
update-locale en_US.UTF-8
export LC_CTYPE="UTF-8"

localectl status
localectl set-locale LANG=en_US.UTF-8
```

### ALIASES

```bash
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/tldr
mkdir -p ~/.local/share/font
mkdir -p ~/.local/bin/dotbare

ln -s /usr/bin/batcat ~/.local/bin/bat
ln -sf /usr/bin/fd ~/.local/bin/fdfind
ln -s /usr/bin/fd ~/.local/bin/fd-find

sudo ln -s /usr/bin/fdfind  /usr/bin/fd
sudo ln -s $(which fd-find) ~/.local/bin/fd
sudo ln -s /usr/bin/batcat  /usr/bin/bat

```

# EXPORTS

```bash

echo eval "$(starship init bash)" >> ~/.bashrc
echo "export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'" >> ~/.bashrc
echo "export FZF_DEFAULT_COMMAND='fd --type file --color=always -follow --hidden --exclude .git'" >> ~/.bashrc
echo "export FZF_DEFAULT_OPTS='--ansi'" >> ~/.bashrc

echo "alias na="nano --tabstospaces --linenumbers --indicator --stateflags \ 
--backupdir='~/.local/nano' --backup --autoindent --minibar--positionlog" >> ~/.bashrc

```
### FONTS

```bash
curl -fLo https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/UbuntuMono/complete/UbuntuMono%20Nerd%20Font%20Complete.otf
curl -fLo https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
unzip JetBrainsMono.zip -d .local/bin/.fonts
```

