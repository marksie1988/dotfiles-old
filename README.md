## Requirements

- gcc
- ncurses-devel
- git
- Powerline Fonts
- zsh (for Centos from source as below)

```
sudo yum install -y gcc ncurses-devel git
```

```
#Install Zsh
wget https://sourceforge.net/projects/zsh/files/zsh/5.8/zsh-5.8.tar.xz/download
tar -xvJf download
cd zsh-5.8/
./configure
make && sudo make install
rm -rf download zsh-5.8
```

## Installation

```
cd ~
git clone https://github.com/marksie1988/dotfiles.git

cd dotfiles
chmod +x installer.sh
./installer.sh
```
