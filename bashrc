PS1="\n\[\e[32m\]\W> \[\e[m\]"
PS2="\[\e[32m\]> \[\e[m\]"

CDPATH="$HOME/Projects"

alias dir='ls -F'
alias ll='ls -AFlho'
alias la='ls -lao'
alias cd='last_dir="`pwd`"; \cd'
alias b='temp_dir="`pwd`"; \cd "$last_dir"; last_dir="$temp_dir"; unset temp_dir;'
alias ..='cd ..'
alias ...='cd ../..'
alias +='pushd'
alias -- -='popd'
alias o='open'
alias desk='cd ~/Desktop'
alias e='open -e'
alias p='pwd'
alias where='lsof | grep -i'
alias rm='\rm -id'
alias vi='vim --noplugin'
alias view='vim -R --noplugin'

prefix=$(brew --prefix)
[ -f $prefix/etc/bash_completion ] && . $prefix/etc/bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

[ -f $prefix/opt/fzf/shell/completion.bash ] && . $prefix/opt/fzf/shell/completion.bash 2> /dev/null
[ -f $prefix/opt/fzf/shell/key-bindings.bash ] && . $prefix/opt/fzf/shell/key-bindings.bash

eval "$(rbenv init -)"
