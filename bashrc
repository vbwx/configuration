shopt -s cdable_vars

PS1="\n\[\e[32m\]\W> \[\e[m\]"
PS2="\[\e[32m\]> \[\e[m\]"

alias dir='ls -F'
alias ll='ls -AFlho'
alias la='ls -lao'
alias cd='last_dir="`pwd`"; \cd'
alias b='temp_dir="`pwd`"; \cd "$last_dir"; last_dir="$temp_dir"; unset temp_dir;'
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
alias update_npm='npm install -g npm@latest'
alias update_nvm='(cd "$NVM_DIR" && git fetch origin && git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin` && . "$NVM_DIR/nvm.sh")'
alias wget='\wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0'
alias rebuild_iconcache='sudo find /private/var/folders -name com.apple.dock.iconcache -exec rm {} \; ; sudo find /private/var/folders -name com.apple.iconservices -exec rm -rf {} \; ; sudo rm -rf /Library/Caches/com.apple.iconservices.store'
alias rebuild_appcache='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local-domain system -domain user -seed'
alias rebuild_spotlight='sudo mdutil -E /'

prefix=$(brew --prefix)
[ -f $prefix/etc/bash_completion ] && . $prefix/etc/bash_completion

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

[ -f $prefix/opt/fzf/shell/completion.bash ] && . $prefix/opt/fzf/shell/completion.bash 2> /dev/null
[ -f $prefix/opt/fzf/shell/key-bindings.bash ] && . $prefix/opt/fzf/shell/key-bindings.bash

eval "$(rbenv init -)"
eval "$(pyenv init -)"
source "$PERLBREW_ROOT/etc/bashrc"
