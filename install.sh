#! /usr/bin/bash
sudo apt-get install ripgrep -y


# ln -s ~/dotfiles/nvim ~/.config/nvim
# ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
#
#
#
#
# function tat {
#   name=$(basename `pwd` | sed -e 's/\.//g')
#
#   if tmux ls 2>&1 | grep "$name"; then
#     tmux attach -t "$name"
#   elif [ -f .envrc ]; then
#     direnv exec / tmux new-session -s "$name"
#   else
#     tmux new-session -s "$name"
#   fi
# }
