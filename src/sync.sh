#!/bin/bash

DT=`date +"%Y-%m-%d_%h-%m"`
echo Current Date and Time is: ${CURRENTDATE}
echo DT is: ${DT}

#sudo mkdir ${DT}
#cd ${DT}


REPODIR=$HOME/repo/stdenv/dotfiles/latest/
HOMEDIR=$HOME


cp -rf $HOMEDIR/.config             $REPODIR
cp -rf $HOMEDIR/.ssh                $REPODIR
cp -rf $HOMEDIR/.tmux               $REPODIR/.config/tmux
cp -rf $HOMEDIR/.tmux.conf          $REPODIR/.config/tmux
cp -rf $HOMEDIR/.vim                $REPODIR/.config/vim
cp -rf $HOMEDIR/src                 $REPODIR/src
cp -rf $HOMEDIR/.fzf                $REPODIR/.local/bin/fzf/
cp -rf $HOMEDIR/.fzf.bash           $REPODIR/.config/fzf/
cp -rf $HOMEDIR/.fzf.zsh            $REPODIR/.config/fzf/
cp -rf $HOMEDIR/.oh-my-zsh/custom   $REPODIR/.config/omz/
cp -rf $HOMEDIR/.bash_aliases       $REPODIR
cp -rf $HOMEDIR/.bashrc             $REPODIR
cp -rf $HOMEDIR/.zshrc              $REPODIR

echo 'DONE!!'



# .ssh/
# .fzf/
# .notes/
# .tmux/
# .vim/
# .src/
# .profile
# .tmux.conf
# .fzf.bash
# .fzf.zsh
# .bash_aliases
# .bashrc
# .zshrc
# .oh-my-zsh/custom/tt-aliases.zsh


# RSYNC

# sudo rsync -rlptzv --progress --delete --exclude=.git --exclude=node_modules "root@192.168.0.42:/mm/dev" .
# sudo rsync -rlptzv --progress --delete --exclude=.git "root@192.168.0.42:/mm/css" .
# sudo rsync -rlptzv --progress --delete --exclude=.git "root@192.168.0.42:/mm/js" .
# sudo rsync -rlptzv --progress --delete --exclude=.git --exclude=node_modules "root@192.168.0.42:/mm/modules" .
# sudo rsync -rlptzv --progress --delete --exclude=.git --exclude=node_modules "root@192.168.0.42:~/.pm2/logs" .


