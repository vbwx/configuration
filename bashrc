shopt -s cdable_vars

prefix=/usr/local
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

alias dir='ls -F'
alias ll='ls -AFlho'
alias la='ls -lao'
alias cd='last_dir="`pwd`"; \cd'
alias 1='temp_dir="`pwd`"; \cd "$last_dir"; last_dir="$temp_dir"; unset temp_dir;'
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
alias wget='\wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0'
alias killall='\killall -i -I'

for cmd in start stop restart reboot reload; do
	alias $cmd=">&2 echo Call sudo $cmd"
done

[ -f $prefix/etc/bash_completion ] && . $prefix/etc/bash_completion

[ -s "${NVM_DIR:-$HOME/.nvm}/nvm.sh" ] && . "${NVM_DIR:-$HOME/.nvm}/nvm.sh" $NVM_ARGS
[[ -r ${NVM_DIR:-$HOME/.nvm}/bash_completion ]] && . ${NVM_DIR:-$HOME/.nvm}/bash_completion

[ -f $prefix/opt/fzf/shell/completion.bash ] && . $prefix/opt/fzf/shell/completion.bash 2> /dev/null
[ -f $prefix/opt/fzf/shell/key-bindings.bash ] && . $prefix/opt/fzf/shell/key-bindings.bash

eval "$(rbenv init -)"
eval "$(pyenv init -)"
source "$PERLBREW_ROOT/etc/bashrc"

unset prefix
