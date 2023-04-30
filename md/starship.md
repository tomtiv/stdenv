# Starship Prompt
Starship is a minimal, blazing-fast, and infinitely customizable prompt for any shell.

Project Homepage: [Starship: Cross-Shell Prompt](https://starship.rs/)
Documentation: [Configuration | Starship](https://starship.rs/config/)

## Installation

### Linux
1. Install the latest version for your system:
```
curl -sS https://starship.rs/install.sh | sh
```
2. Add the following to the end of `~/.bashrc` or `~/.zshrc`:
```
eval "$(starship init bash)"
# -- or --
eval "$(starship init zsh)"
```

curl -fLo "UbuntuMono Nerd Font Complete.otf" \
https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/UbuntuMono.zip/complete/UbuntuMono%20Nerd%20Font%20Complete.otf


https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Agave.zip

## bat

sudo apt install bat

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

~/.local/bin/bat

mkdir -p ~/.local/bin
ln -s /mnt/host/c/Users/tomtiv


## find

sudo apt-get install fd-find
ln -s $(which fdfind) ~/.local/bin/fd


## Procs

https://github.com/dalance/procs/releases/download/v0.13.3/procs-v0.13.3-x86_64-linux.zip


# SYM-LINKS

ln -s /mnt/c/users/tomtiv/.config  ~/.config
ln -s /mnt/c/users/tomtiv/.fonts  ~/.fonts
ln -s /mnt/c/users/tomtiv/.starship  ~/.starship
ln -s $(which fdfind) ~/.local/bin/fd


# STARSHIP CONFIG - starship.toml

# Inserts a blank line between shell prompts
add_newline = true

# Change command timeout from 500 to 1000 ms
command_timeout = 1000

# Change the default prompt format
# ---
# old config ...
 format = """\
 [╭╴](238)$all \
 $env_var       \
 [╰─](238)$character"""

# new config
#format = """$env_var $all"""

# Change the default prompt characters
[character]
# old config
success_symbol = "[](238)"
error_symbol = "[](238)"
#success_symbol = ""
#error_symbol = ""

# Shows an icon that should be included by zshrc script based on the distribution or os

[env_var.STARSHIP_DISTRO]
format = '[$env_value](yellow)'
variable = "STARSHIP_DISTRO"
disabled = false

[hostname]
ssh_only = false
format = "[$hostname](bold blue)"
disabled = false

# Shows the username
[username]
style_user = "white"
style_root = "red"
format = "-[$user]($style)"
disabled = false
show_always = true

[directory]
truncation_length = 1
truncation_symbol = "…/"
home_symbol = " ~"
read_only_style = "197"
read_only = "  "
format = " in [$path]($style)[$read_only]($read_only_style) "

[git_branch]
symbol = " "
format = "via [$symbol$branch]($style) "
truncation_length = 4
truncation_symbol = "…/"
style = "bold green"

[git_status]
format = '[\($all_status$ahead_behind\)]($style) '
style = "bold green"
conflicted = "🏳"
up_to_date = " "
untracked = " "
ahead = "⇡${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
behind = "⇣${count}"
stashed = " "
modified = " "
staged = '[++\($count\)](green)'
renamed = "襁 "
deleted = " "

[docker_context]
format = "via [ $context](bold blue) "
disabled = false

[nodejs]
format = "via [ $version](bold green) "
disabled = false

# (deactivated because of no space left)
#

[kubernetes]
format = 'via [ﴱ $context\($namespace\)](bold purple) '
disabled = true

[vagrant]
format = "via [ vagrant $version]($style) "
disabled = true

[helm]
format = "via [ $version](bold purple) "
disabled = true

[python]
symbol = " "
python_binary = "python3"
disabled = true

[ruby]
format = "via [ $version]($style) "
disabled = true