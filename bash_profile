[ -r "$HOME/.profile" ] && source "$HOME/.profile"
if [[ $- =~ i ]]; then
	[ -r "$HOME/.bashrc" ] && source "$HOME/.bashrc"

	# Interactive login shell startup
	fortune -a | cowsay
fi
