## Requirements

- gcc
- ncurses-devel
- git
- zsh (5.3.1 minuimum) (for Centos from source as below)

```
sudo yum install -y gcc ncurses-devel git
```

### Install Zsh
```
wget https://sourceforge.net/projects/zsh/files/zsh/5.8/zsh-5.8.tar.xz/download
tar -xvJf download
cd zsh-5.8/
./configure
make && sudo make install
rm -rf download zsh-5.8
```

### Set Zsh as default shell

```
chsh -s $(which zsh)
```

## Add custom dot files

```
cd ~
git clone https://github.com/marksie1988/dotfiles.git

cd dotfiles
chmod +x installer.sh
./installer.sh
```
