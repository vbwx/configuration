" Copyright 2016-2017 Bernhard Waldbrunner

"{{{ Load Defaults
	unlet! skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
"}}}

"{{{ Options
	set relativenumber
	set showmatch
	set hlsearch
	set ignorecase
	set smartcase
	set smarttab
	set autoread
	set autowrite
	set autoindent
	set copyindent
	set preserveindent
	set modeline
	set lazyredraw
	set complete-=i
	set modelines=3
	set display+=uhex
	set foldmethod=indent
	set foldlevelstart=99
	set wildignore=*/.git/*,*/.svn/*,*/.sass-cache/*,*/.tmp/*,*/.temp/*,.DS_Store,Thumbs.db,._*,tags
	set encoding=utf-8
	set spelllang=en
	set listchars=tab:┆\ ,nbsp:·
	set tabstop=4
	set shiftwidth=4
	set softtabstop=0
	set textwidth=100
	set history=1000
	set tabpagemax=40
	set scrolloff=2
	set laststatus=2
	set selectmode=mouse
	set viminfo^=!
	set sessionoptions-=options
	set grepformat=%f:%l:%c:%m
	set noerrorbells visualbell t_vb=
"}}}

"{{{ Bundles
	call plug#begin()

	"{{{ User Interface
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'chriskempson/base16-vim'
	"}}}

	"{{{ Tools
	Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle']}
	Plug 'wincent/command-t', {'do': 'cd ruby/command-t/ext/command-t; /usr/bin/ruby extconf.rb && make'}
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-session'
	Plug 'xolox/vim-shell'
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'embear/vim-localvimrc'
	Plug 'vim-utils/vim-man'
	" Plug 'KabbAmine/gulp-vim'
	" Plug 'mklabs/grunt.vim'

	if !empty(glob("/Applications/Dash.app"))
		Plug 'rizzatti/dash.vim'
	elseif executable('zeal')
		Plug 'KabbAmine/zeavim.vim'
	endif
	"}}}

	"{{{ Editing
	Plug 'majutsushi/tagbar'
	Plug 'vim-scripts/todolist.vim'
	Plug 'sjl/gundo.vim'
	Plug 'mhinz/vim-signify'
	Plug 'scrooloose/syntastic'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'jacquesbh/vim-showmarks'
	Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-repeat'
	Plug 'vbwx/vim-unimpaired'
	Plug 'tpope/vim-sleuth'
	Plug 'godlygeek/tabular'
	Plug 'tpope/vim-surround'
	Plug 'tkhren/vim-fake'
	Plug 'Valloric/YouCompleteMe', {'do': 'python install.py --tern-completer'}
	Plug 'Chiel92/vim-autoformat'
	Plug 'tmhedberg/matchit'
	Plug 'lfilho/cosco.vim'
	Plug 'dyng/ctrlsf.vim'
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	"}}}

	"{{{ Language Support
	Plug 'mattn/emmet-vim'
	Plug 'pangloss/vim-javascript'
	Plug 'hail2u/vim-css3-syntax'
	Plug 'lervag/vimtex'
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'vim-pandoc/vim-pandoc-syntax'
	Plug 'vim-pandoc/vim-pandoc-after'
	Plug 'mustache/vim-mustache-handlebars'
	Plug 'darfink/vim-plist'
	Plug 'shawncplus/phpcomplete.vim'
	Plug 'vim-php/tagbar-phpctags.vim'
	" Plug 'isRuslan/vim-es6'
	" Plug 'jalvesaq/Nvim-R'
	" Plug 'vim-pandoc/vim-rmarkdown'
	" Plug 'leafgarland/typescript-vim'
	" Plug 'digitaltoad/vim-pug'
	" Plug 'kchmck/vim-coffee-script'
	" Plug 'lumiliet/vim-twig'
	"}}}

	call plug#end()
"}}}

"{{{ Plugin Settings
	let maplocalleader = '\\'

	let g:loaded_netrwPlugin = 1

	let g:solarized_menu = 0

	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#wordcount#filetypes .= '|pandoc'

	let g:localvimrc_name = ['.vimrc']
	let g:localvimrc_persistent = 2
	let g:localvimrc_persistence_file = $HOME.'/.vim/localvimrc'

	let g:syntastic_mode_map = {
	\	'mode': 'passive',
	\	'active_filetypes': []
	\ }

	let g:UltiSnipsExpandTrigger = "<C-Down>"
	let g:UltiSnipsJumpForwardTrigger = "<C-Right>"
	let g:UltiSnipsJumpBackwardTrigger = "<C-Left>"
	let g:UltiSnipsEditSplit = "vertical"

	let g:visualstar_extra_commands = 'zzzv'

	let g:user_emmet_install_global = 0
	let g:user_emmet_mode = 'nv'
	let g:user_emmet_leader_key = maplocalleader

	if !exists('g:ycm_semantic_triggers')
		let g:ycm_semantic_triggers = {}
	endif
	let g:ycm_semantic_triggers.tex = [
	\	're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
	\	're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
	\	're!\\hyperref\[[^]]*',
	\	're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
	\	're!\\(include(only)?|input){[^}]*',
	\	're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
	\	're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
	\	're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
	\ ]

	let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
	let g:vimtex_view_general_options = '-r @line @pdf @tex'
	let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']

	let g:table_mode_map_prefix = '<Bar>'
	let g:table_mode_tableize_d_map = '<Bar>T'

	let g:cosco_ignore_comment_lines = 1
	let g:cosco_filetype_whitelist = ['php', 'javascript', 'c', 'cpp', 'css', 'typescript']

	let NERDMenuMode = 0

	let g:session_autosave = 'yes'
	let g:session_autoload = 'yes'

	let g:gutentags_generate_on_missing = 0
	let g:gutentags_generate_on_new = 0

	let g:shell_mappings_enabled = 0

	let g:CommandTTraverseSCM = 'dir'
	let g:CommandTFileScanner = 'git'
	let g:CommandTGitScanSubmodules = 1
	let g:CommandTGitIncludeUntracked = 1
	let g:CommandTEncoding = 'UTF-8'
 	if &term =~ "xterm" || &term =~ "screen"
		let g:CommandTCancelMap = ['<Esc>', '<C-C>']
  	endif
"}}}

"{{{ Mappings
	" [Space] is the new leader key
	map <Space> <Leader>
	map <Leader><Space> <Localleader>
	map <Leader><S-Space> <Localleader>
	imap <C-Space> <C-O><Localleader>
	imap <C-\> <C-O><Localleader>
	" [Ctrl]+[C] doesn't trigger InsertLeave autocommands, so I map it to [Esc]
	inoremap <C-C> <Esc>
	vnoremap <C-C> <Esc>
	" Workaround for keyboards without [Delete] key
	map <S-Del> <Del>
	map! <S-Del> <Del>
	map <S-BS> <Del>
	map! <S-BS> <Del>
	" Close a window with [Ctrl]+[C]
	nnoremap <C-C> <C-W>c
	" Faster access to command line with [Return]
	nnoremap <CR> :
	" Insert selected text as search command into command line with [Return]
	xnoremap <CR> y:/\V\(<C-R>=escape(getreg('"'), '/\')<CR>\)/<C-B>
	smap <CR> <C-G><CR>
	" Faster shell command execution with [Alt]+[Return]
	noremap <A-CR> :!
	" Add a line below in insert mode with [Ctrl]+[Return] or [Cmd]+[Return]
	inoremap <C-CR> <C-O>o
	" Add a line above in insert mode with [Shift]+[Return] or [Shift]+[Cmd]+[Return]
	inoremap <S-CR> <C-O>O
	" Jump to tag with [Shift]+[Return]
	nnoremap <S-CR> <C-]>
	" Jump back with [Shift]+[Backspace] or [Backspace]
	nnoremap <S-BS> <C-T>
	nnoremap <BS> <C-T>
	" Ex mode is unnecessary
	nmap Q <NOP>
	" Jumping to a specific column is seldom necessary
	nmap <Bar> <NOP>
	nnoremap <Bar><Bar> <Bar>
	" Write & close a tab with [Shift]+[Z][Shift]+[Tab]
	nnoremap <silent> Z<S-Tab> :<C-R>=&mod ? 'w <Bar> ' : ''<CR>tabclose<CR>
	" Close a tab with [Shift]+[Q][Shift]+[Tab]
	nnoremap <silent> Q<S-Tab> :tabclose!<CR>
	" Open a new tab with [Z][Tab]
	nnoremap <silent> z<Tab> :tabnew<CR>
	" Open a new tab after the last one with [G][Tab]
	nnoremap <silent> g<Tab> :$tabnew<CR>
	" Open a new tab before the first one with [G][Shift]+[Tab]
	nnoremap <silent> g<S-Tab> :0tabnew<CR>
	" Switching between windows
	nnoremap <C-Down> <C-W>j
	nnoremap <C-Up> <C-W>k
	nnoremap <C-Left> <C-W>h
	nnoremap <C-Right> <C-W>l
	" Help shortcut is unnecessary
	noremap <F1> <Esc>
	inoremap <F1> <Esc>
	" Save & close a buffer with [Shift]+[Q][Shift]+[Q]
	nnoremap QQ :<C-R>=&mod ? 'w <Bar> ' : ''<CR>bdelete<CR>
	" Discard changes in a buffer with [Shift]+[Q][Shift]+[Z]
	nnoremap QZ :bdelete!<CR>
	" Redraw screen, update diff & fix syntax highlighting with [Ctrl]+[L]
	nnoremap <silent> <C-L> :syntax sync fromstart<C-R>=has('diff') ? ' <Bar> diffupdate' : ''<CR><CR><C-L>
	" Toggle folds with [Tab]
	nnoremap <Tab> za
	" Toggle folds recursively with [Shift]+[Tab]
	nnoremap <S-Tab> zA
	" Shortcut for :diffupdate
	nnoremap du :diffupdate<CR>
	" Automatically open folds when jumping to a line
	nnoremap G Gzv
	" Clear search highlighting with [Z][/]
	nnoremap z/ :nohl<CR>
	" Make [Shift]+[Y] behave like [Shift]+[D] or [Shift]+[C]
	nmap Y y$
	" Shortcut for accessing the system clipboard
	noremap - "*
	sunmap -
	" Faster global substitution (who needs a shortcut for :sleep, anyway?)
	noremap gs :%s/\v//cgI<Left><Left><Left><Left><Left>
	noremap gS :g/\v/s/\v//g<Left><Left><Left><Left><Left><Left><Left><Left>
	" Faster search
	nnoremap g/ :nohl<CR>/\v
	xnoremap g/ <Esc>:nohl<CR>gv/\v
	nnoremap g? :nohl<CR>?\v
	xnoremap g? <Esc>:nohl<CR>gv?\v
	" [Cmd]+[Return] is an alternative for [Ctrl]+[Return]
	nmap <D-CR> <C-CR>
	vmap <D-CR> <C-CR>
	imap <D-CR> <C-CR>
	" [Shift]+[Cmd]+[Return] is an alternative for [Shift]+[Return]
	nmap <S-D-CR> <S-CR>
	vmap <S-D-CR> <S-CR>
	imap <S-D-CR> <S-CR>

	" Reference the directory of the current file in command line
	cnoremap %/ %:p:h/
	" Fast command for global substitution
	cnoremap %s %s///g<Left><Left><Left>

	" {{{ Plugin Mappings
	if &loadplugins
		" Format buffer with [\][=]
		nnoremap <Leader>= :Autoformat<CR>
		" Align words/operators/columns across multiple lines with [\][,]
		noremap <Leader>, :Tabularize /
		" Move focus to file explorer with [\][`]
		nnoremap <silent> <Leader>` :NERDTreeFocus<CR>
		" Change working directory of file explorer with [\][~]
		nnoremap <silent> <Leader>~ :NERDTreeCWD<CR>
		" Reveal current file in file explorer with [\][%]
		nnoremap <silent> <Leader>% :NERDTreeFind<CR>
		" Check syntax with [\][^]
		nnoremap <Leader>^ :SyntasticCheck<CR>
		" Look up keyword in Dash with [Space][D]
		nnoremap <Leader>k :Dash<CR>
		" Look up keyword in all Dash docsets with [Space][Shift]+[D]
		nnoremap <Leader>K :Dash!<CR>
		" Show undo tree
		nnoremap <silent> <Leader>u :GundoShow<CR>
		" Show mark positions when using jump command
		nnoremap <silent> ` :ShowMarksOnce<CR>`
		nnoremap <silent> ' :ShowMarksOnce<CR>'
		nnoremap <silent> g` :ShowMarksOnce<CR>g`
		nnoremap <silent> g' :ShowMarksOnce<CR>g'
		" Recursive search & replace in the working directory
		nnoremap <silent> <Leader>f :CtrlSFOpen<CR>
		nnoremap <silent> <Leader>F :CtrlSFUpdate<CR>
		nmap <Leader>/ <Plug>CtrlSFPrompt
		nmap <Leader>n <Plug>CtrlSFPwordPath
		nmap <Leader>* <Plug>CtrlSFCCwordPath
		nmap <Leader># <Plug>CtrlSFCwordPath
		vmap <Leader>* <Plug>CtrlSFVwordPath
		" Command-T shortcuts
		nmap <silent> <Leader>r <Plug>(CommandTMRU)
		nmap <silent> <Leader>? <Plug>(CommandTSearch)
		nmap <silent> <Leader>h <Plug>(CommandTHelp)
		nmap <silent> <Leader>: <Plug>(CommandTHistory)
		nmap <silent> <Leader>b <Plug>(CommandTBuffer)
		nmap <silent> <Leader>t <Plug>(CommandTTag)
		nmap <silent> <Leader>j <Plug>(CommandTJump)
		nmap <silent> <Leader>l <Plug>(CommandTLine)
		nmap <silent> <Leader>' <Plug>(CommandT)
		nmap <silent> <Leader><CR> <Plug>(CommandTCommand)
		" Move focus to tag bar with [Space][Shift]+[T]
		nnoremap <silent> <Leader>T :TagbarOpen fj<CR>
		" Reveal current tag in tag bar with [\][$]
		nnoremap <silent> <Leader>$ :TagbarShowTag<CR>
		" Generate a tags file for the current project with [\][!]
		nnoremap <Leader>! :GutentagsUpdate!<CR>
		" Insert semicolon or comma at the end of the line with [\][;] or [Alt]+[Return]
		nmap <Leader>; <Plug>(cosco-commaOrSemiColon)
		imap <A-CR> <C-O><Plug>(cosco-commaOrSemiColon)
		" Quickly create a document with [Space][P]
		nnoremap <Leader>p :exec "Pandoc ".(&tag =~ '[,/;]' ? 'pdf' : &tag)<CR>
		nnoremap <Leader>P :exec "Pandoc! ".(&tag =~ '[,/;]' ? 'pdf' : &tag)<CR>
		" Open a URI in the browser with [Ctrl]+[Return]
		nnoremap <C-CR> :Open<CR>
	endif
	" }}}
"}}}

"{{{ Abbreviations
	if !empty(glob('/Applications/Utilities/Terminal.app'))
		" Open a Terminal window at the directory of the current file
		cabbrev TERM !open -a Terminal %/
		" Open a Terminal window at the current working directory
		cabbrev WTERM !open -a Terminal <C-R>=getcwd()<CR>
	endif
"}}}

"{{{ Auto Commands
	" Prevent comment insertion when inserting new lines; remove comment leader when joining lines and
	" add comment leader on [Return]
	autocmd FileType * setlocal formatoptions-=o formatoptions+=jr
	" Syntax specific formatting
	autocmd FileType tex setlocal formatoptions+=1
	autocmd FileType text,markdown,pandoc setlocal formatoptions+=tcn1

	if &loadplugins
		" Enable Emmet for HTML & CSS files
		autocmd FileType html,css EmmetInstall
		" Strip trailing whitespace before saving
		autocmd BufEnter * EnableStripWhitespaceOnSave
	endif
"}}}

"{{{ Syntax Highlighting
	colorscheme base16-tomorrow-night
	highlight! link ExtraWhitespace Todo
"}}}

"{{{ Functions
	function! UpdateSkim(status)
		if !a:status | return | endif

		let l:out = b:vimtex.out()
		let l:tex = expand('%:p')
		let l:cmd = [g:vimtex_view_general_viewer, '-r']
		if !empty(system('pgrep Skim'))
			call extend(l:cmd, ['-g'])
		endif
		if has('nvim')
			call jobstart(l:cmd + [line('.'), l:out, l:tex])
		elseif has('job')
			call job_start(l:cmd + [line('.'), l:out, l:tex])
		else
			call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
		endif
	endfunction
"}}}

"{{{ Custom Commands
	" Count words of a document using Pandoc
	command! -bar -range=% Count <line1>,<line2>w !
	\	pandoc -t plain | wc -w | sed -e 's/[[:space:]]//g' -e 's/$/ words/'
"}}}

" vim: ts=5:sw=5:fdm=marker:fdl=0:fdc=3
