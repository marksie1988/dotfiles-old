## Requirements

- git
- Powerline Fonts - https://github.com/powerline/fonts.git


```
sudo yum install -y git
```

## Add custom dot files

```
cd ~
git clone https://github.com/marksie1988/dotfiles.git

cd dotfiles
chmod +x deploy.sh
./deploy.sh
```

# Basic runtime operations

All default dotfiles (.zshrc, .vimrc, etc) source something within the dotfiles repository. This helps separate changes that are synced across all your machines with system-specific changes.

Upon launching a new shell, the first thing that's evaluated is zshrc_manager.sh. This script first launches tmux. Then once zsh logs in, within tmux, it updates the dotfiles repository, and sources the changes.
