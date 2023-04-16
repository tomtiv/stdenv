###########################
# Install Rust
###########################

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup component add rls rust-analysis rust-src
rustup component add rustfmt

cargo install ripgrep
cargo fmt


sudo apt install ranger bat fzf fd-find


ln -s $(which fd-find) ~/.local/bin/fd

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type file --color=always -follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
