function zle-keymap-select zle-line-init zle-line-finish {
	local cmd_seq="\E]50;CursorShape=0\C-G"
	local ins_seq="\E]50;CursorShape=1\C-G"
	if [[ ! -z "${TMUX}" ]]; then
		case $KEYMAP in
			vicmd)      print -n -- "\ePtmux;\e${cmd_seq}\e\\";; # block cursor
			viins|main) print -n -- "\ePtmux;\e${ins_seq}\e\\";; # line cursor
		esac
	else
		case $KEYMAP in
			vicmd)      print -n -- "${cmd_seq}";; # block cursor
			viins|main) print -n -- "${ins_seq}";; # line cursor
		esac
	fi

	zle reset-prompt
	zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
