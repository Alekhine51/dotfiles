#!/usr/bin/fish

curl -L https://get.oh-my.fish | fish

alias -s vim=nvim
alias -s ls=exa
alias -s cat=bat
alias -s find=fd
alias -s grep=rg

fish_add_path /home/alekhine/.local/bin/

# set to boot in console
# to undo: sudo systemctl set-default graphical.target
#sudo systemctl set-default multi-user.target

sudo systemctl enable sshd
sudo systemctl start sshd # SSH server
