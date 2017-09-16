shopt -s cdable_vars

PS1="\n\[\e[32m\]\W> \[\e[m\]"
PS2="\[\e[32m\]> \[\e[m\]"

if [[ "$OSTYPE" == darwin* ]]; then
	alias o='open'
	alias locate='mdfind'
elif [[ "$OSTYPE" == cygwin* ]]; then
	alias o='cygstart'
	alias pbcopy='tee > /dev/clipboard'
	alias pbpaste='cat /dev/clipboard'
else
	alias o='xdg-open'
	if type -t xclip > /dev/null; then
		alias pbcopy='xclip -selection clipboard -in'
		alias pbpaste='xclip -selection clipboard -out'
	elif type -t xsel > /dev/null; then
		alias pbcopy='xsel --clipboard --input'
		alias pbpaste='xsel --clipboard --output'
	fi
fi
if type -t curl > /dev/null; then
	alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif type -t wget > /dev/null; then
	alias get='wget --continue --progress=bar --timestamping --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15'
fi

alias dir='ls -F'
alias ll='ls -AFlho'
alias la='ls -lao'
alias cd='_dirs[3]="${_dirs[2]}"; _dirs[2]="${_dirs[1]}"; _dirs[1]="`pwd`"; \cd'
alias 1='_dirs[0]="`pwd`"; \cd "${_dirs[1]}"; _dirs[1]="${_dirs[0]}"; unset _dirs[0];'
alias 2='_dirs[0]="`pwd`"; \cd "${_dirs[2]}"; _dirs[2]="${_dirs[0]}"; unset _dirs[0];'
alias 3='_dirs[0]="`pwd`"; \cd "${_dirs[3]}"; _dirs[3]="${_dirs[0]}"; unset _dirs[0];'
alias _='sudo '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias +='pushd'
alias -- -='popd'
alias pbc='pbcopy'
alias pbp='pbpaste'
alias e="${VISUAL:-$EDITOR}"
alias p='pwd'
alias where='lsof | grep -i'
alias rm='\rm -id'
alias add='awk "{s+=\$1} END {printf \"%.2f\n\", s}"'
alias killall='\killall -i -I'
alias df='\df -kh'
alias du='\du -kh'
alias man='viman'

for cmd in start stop restart reboot reload; do
	alias $cmd=">&2 echo Call sudo $cmd"
done

if type -t pandoc > /dev/null; then
	function qpdf {
		pandoc "$1" -o "${1%.*}.pdf"
	}
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

[ -f /usr/local/opt/fzf/shell/completion.bash ] && . /usr/local/opt/fzf/shell/completion.bash 2> /dev/null
[ -f /usr/local/opt/fzf/shell/key-bindings.bash ] && . /usr/local/opt/fzf/shell/key-bindings.bash

unset prefix
