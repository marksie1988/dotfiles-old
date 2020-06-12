#!/bin/sh
path=$(pwd)

#Install spaceship theme
[ ! -d $path/spaceship-prompt ] git clone https://github.com/denysdovhan/spaceship-prompt.git
ln -sf $path/spaceship-prompt/spaceship.zsh /usr/local/share/zsh/site-functions/prompt_spaceship_setup

#ZSH plugins directory
[ ! -d /usr/share/zsh/plugins/ ] && mkdir -p /usr/share/zsh/plugins/
ln -sf $path/files/zsh/plugins /usr/share/zsh/plugins/

# Home directory
ln -sf $path/.bash_profile $HOME/.bash_profile
ln -sf $path/.bashrc $HOME/.bashrc
ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/.profile $HOME/.profile
ln -sf $path/.zshenv $HOME/.zshenv
ln -sf $path/.zshrc $HOME/.zshrc

# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

[ -d $HOME/.config/shellconfig ] && rm -rf $HOME/.config/shellconfig
ln -sf $path/config/shellconfig $HOME/.config/shellconfig

ln -sf $path/config/starship.toml $HOME/.config/starship.toml

# Local directroy
[ ! -d $HOME/.local ] && mkdir -p $HOME/.local/share
[ ! -d $HOME/.local/share ] && mkdir $HOME/.local/share
[ -d $HOME/.local/share/fonts ] && rm -r $HOME/.local/share/fonts
ln -sf $path/.local/share/fonts $HOME/.local/share/fonts

# Var directory
[ ! -d /var ] && sudo mkdir -p /var/spool/cron
[ ! -d /var/spool ] && sudo mkdir -p /var/spool/cron
[ -d /var/spool/cron ] && rm -rf /var/spool/cron
sudo ln -sf $path/cron /var/spool/cron
