#!/bin/sh
#
# [d]aemonize

while [ -z "$term" ]; do
	while read -r pid _ppid comm; do
		case $pid in
		"${ppid:-$$}")
			ppid=$_ppid && break
		esac
	done <<- EOF
	$(ps -f -o pid -o ppid -o comm)
	EOF

	case $comm in
	"${0##*/}"|"${SHELL##*/}"|init) ;;
	*) term=$comm ;;
	esac
done

setsid "$@" 2>/dev/null &! (sleep 0.01 && kill -9 "$ppid")
