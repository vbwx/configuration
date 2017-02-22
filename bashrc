shopt -s cdable_vars

PS1="\n\[\e[32m\]\W> \[\e[m\]"
PS2="\[\e[32m\]> \[\e[m\]"

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
alias o='open'
alias e='open -e'
alias p='pwd'
alias where='lsof | grep -i'
alias rm='\rm -id'
alias add='awk "{s+=\$1} END {printf \"%.2f\n\", s}"'
alias wget='\wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0'
alias killall='\killall -i -I'
for cmd in start stop restart reboot reload; do
	alias $cmd=">&2 echo Call sudo $cmd"
done

prefix=$(brew --prefix)
[ -f $prefix/etc/bash_completion ] && . $prefix/etc/bash_completion

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

[ -f $prefix/opt/fzf/shell/completion.bash ] && . $prefix/opt/fzf/shell/completion.bash 2> /dev/null
[ -f $prefix/opt/fzf/shell/key-bindings.bash ] && . $prefix/opt/fzf/shell/key-bindings.bash

eval "$(rbenv init -)"
eval "$(pyenv init -)"
source "$PERLBREW_ROOT/etc/bashrc"
