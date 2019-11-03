# ver: 1.0
if [ -n "$TMUX" ]; then
    # called inside tmux session, do tmux things
    . ~/.profile

fi
# Trigger ~/.bashrc commands
. ~/.bashrc
