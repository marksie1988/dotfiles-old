## Requirements

- gcc
- ncurses-devel
- zsh 5.8

```
sudo yum install -y gcc ncurses-devel
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
git clone this repo

cd dotfiles
chmod +x installer.sh
./installer.sh
```
