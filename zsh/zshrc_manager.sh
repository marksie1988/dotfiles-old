time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

VERSION="v0.2.0"

# Run tmux if exists
#if command -v tmux>/dev/null; then
#	if [ "$DISABLE_TMUX" = "true" ]; then
#		echo "DISABLE_TMUX=true"
#	else
#		[ -z $TMUX ] && exec tmux
#	fi
#else
#	echo "tmux not installed. Run ./deploy to configure dependencies"
#fi

echo "Checking for updates."
LATEST_VERSION=$(curl -s https://api.github.com/repos/marksie1988/dotfiles/releases/latest \
| grep "tag_name" \
| awk '{print substr($2, 2, length($2)-3)}')


if [ $VERSION = $LATEST_VERSION ]
then
	echo "Already using $LATEST_VERSION."
else
	echo "Updates Detected -"
	echo "Installed Version: $VERSION"
	echo "Latest Version: $LATEST_VERSION"
	({cd ~/dotfiles} &> /dev/null && git log $LATEST_VERSION ..@{u} --pretty=format:%Cred%aN:%Creset\ %s\ %Cgreen%cd)
	echo "Setting up..."
	({cd ~/dotfiles} &> /dev/null && git pull -q && git checkout $LATEST_VERSION && git submodule update --init --recursive)
fi

source ~/dotfiles/zsh/zshrc.sh
