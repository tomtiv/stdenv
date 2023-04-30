

git clone https://github.com/kazhala/dotbare.git ~/.config/dotbare
#git clone https://github.com/kazhala/dotbare.git ~/.dotbare


source ~/.dotbare/dotbare.plugin.bash


etup

    init git bare repository.

    Note: by default, dotbare finit will set up a bare repository in $HOME/.cfg, to customize location and various other settings, checkout customization

    dotbare finit

    add dotfiles you want to track.

    Treat dotbare as normal git commands.

    dotbare fadd -f
    # or
    dotbare add [FILENAME]

    # add entire repository like .config directory
    dotbare fadd -d
    # or
    dotbare add [DIRECTORY]

    commit changes and push to remote.

    dotbare commit -m "First commit"
    dotbare remote add origin [URL]
    dotbare push -u origin master