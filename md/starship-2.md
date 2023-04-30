# STARSHIP CONFIG

# ~/.config/starship.toml

add_newline = true
command_timeout = 1000
continuation_prompt = "▶▶"

#format = """\
#[$env_value](white)
#[┌─](white)[$all]()
#[$env_var](white)
#[╰$character](white) """
# format = """\
#[$hostname](63])$all \
#[╰─](238)$character"""

 format = """\
[╭─$hostname@$username$all](63)\
[╰─$character](63)"""

[character]
success_symbol = "[➜](63)"
error_symbol = "[✗](bold red)"

# Shows an icon that should be included by zshrc script based on the distribution or os
[env_var.STARSHIP_DISTRO]
format = '[$env_value](226)'
variable = "STARSHIP_DISTRO"

[sudo]
style = "196"
symbol = "💻"
disabled = true

[hostname]
ssh_only = false
format = "[$hostname](blue)[$ssh_symbol](bold purple)"
# trim_at = ".companyname.com"
disabled = false
ssh_symbol ="🌏"

# Shows the username
[username]
style_user = "white"
style_root = "bold red"
format = "[$user]($style)"
disabled = false
show_always = true

[directory]
truncation_length = 1
truncation_symbol = "…/"
home_symbol = " ~"
read_only_style = "197"
read_only = "  "
format = " [$path]($style)[$read_only]($read_only_style) "

[git_branch]
symbol = " "
format = "via [$symbol$branch]($style) "
# truncation_length = 4
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
format = " [ $context](bold blue) "
disabled = false

[nodejs]
format = "[  $version](bold green) "
disabled = false

# (deactivated because of no space left)
#

[kubernetes]
format = 'via [ﴱ $context\($namespace\)](bold purple) '
disabled = true

[terraform]
format = "via [ terraform $version]($style) 壟 [$workspace]($style) "
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
```