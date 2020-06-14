## Requirements

- git

```
sudo yum install -y git
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
echo "/usr/local/bin/zsh" >> /etc/shells
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
