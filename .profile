[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="st"
export COLORTERM="truecolor"
export PAGER="less"
export WM="bspwm"

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
