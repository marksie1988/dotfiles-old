#!/bin/sh
path=$(pwd)

#Install spaceship theme
[ ! -d $path/spaceship-prompt/ ] && git clone https://github.com/denysdovhan/spaceship-prompt.git
[ ! -d /usr/local/share/zsh/site-functions/ ] && mkdir -p /usr/local/share/zsh/site-functions/
ln -sf $path/spaceship-prompt/spaceship.zsh /usr/local/share/zsh/site-functions/prompt_spaceship_setup

# Zsh Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/local/share/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git /usr/local/share/plugins/zsh-you-should-use

# Home directory
ln -sf $path/.bash_profile $HOME/.bash_profile
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
[ -d $HOME/.fonts ] && rm -r $HOME/.fonts
ln -sf $path/.local/share/fonts $HOME/.fonts

# Var directory
[ ! -d /var ] && sudo mkdir -p /var/spool/cron
[ ! -d /var/spool ] && sudo mkdir -p /var/spool/cron
[ -d /var/spool/cron ] && rm -rf /var/spool/cron
sudo ln -sf $path/cron /var/spool/cron
