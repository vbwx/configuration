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
	set gdefault
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
	set wildignore=.git,.svn,.sass-cache,.tmp,.temp,.DS_Store,Thumbs.db,.tags,._*
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
	set noerrorbells visualbell t_vb=

	setglobal tags=./.tags,.tags;$HOME
"}}}

"{{{ Plugin Settings
	let maplocalleader = '\\'

	let g:solarized_menu = 0

	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1

	let g:indentLine_char = '┆'
	let g:indentLine_enabled = 0

	let g:syntastic_mode_map = {
	\	'mode': 'passive',
	\	'active_filetypes': []
	\ }

	let g:UltiSnipsExpandTrigger = "<C-Down>"
	let g:UltiSnipsJumpForwardTrigger = "<C-Right>"
	let g:UltiSnipsJumpBackwardTrigger = "<C-Left>"
	let g:UltiSnipsEditSplit = "vertical"

	let g:strip_whitespace_on_save = 1

	let g:EditorConfig_exclude_patterns = ['fugitive://.*']

	let g:visualstar_extra_commands = 'zzzv'

	let g:user_emmet_install_global = 0
	let g:user_emmet_mode = 'nv'
	let g:user_emmet_leader_key = maplocalleader

	let g:yankstack_map_keys = 0

	let g:ctrlp_map = '<Leader>p'
	let g:ctrlp_working_path_mode = 'rc'
	let g:ctrlp_match_window = 'min:3,max:15,results:200'
	let g:ctrlp_unicode_unicodedata_file = '/usr/local/share/unicode/UnicodeData.txt'
	if has('python')
		let g:ctrlp_match_func = {'match': 'matcher#cmatch'}
	endif

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
"}}}

"{{{ Bundles
	call plug#begin()

	"{{{ User Interface
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'chriskempson/base16-vim'
	"}}}

	"{{{ Fuzzy Finder
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'JazzCore/ctrlp-cmatcher', {'do': 'export CFLAGS=-Qunused-arguments; export CPPFLAGS=-Qunused-arguments; ./install.sh'}
	Plug 'mattn/ctrlp-mark'
	Plug 'mattn/ctrlp-register'
	Plug 'ompugao/ctrlp-history'
	Plug 'lokikl/vim-ctrlp-ag'
	Plug 'ivalkeen/vim-ctrlp-tjump'
	Plug 'DavidEGx/ctrlp-smarttabs'
	Plug 'fisadev/vim-ctrlp-cmdpalette'
	Plug 'endel/ctrlp-filetype.vim'
	Plug 'suy/vim-ctrlp-unicode'
	Plug 'jasoncodes/ctrlp-modified.vim'
	Plug 'zeero/vim-ctrlp-help'
	"}}}

	"{{{ Tools
	Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle']}
	Plug 'majutsushi/tagbar'
	if !empty(glob("/Applications/Dash.app"))
		Plug 'rizzatti/dash.vim'
	elseif executable('zeal')
		Plug 'KabbAmine/zeavim.vim'
	endif
	Plug 'scrooloose/syntastic'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'vim-utils/vim-man'
	" Plug 'KabbAmine/gulp-vim'
	" Plug 'mklabs/grunt.vim'
	"}}}

	"{{{ Editing
	Plug 'Yggdroot/indentLine'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'jacquesbh/vim-showmarks'
	Plug 'tpope/vim-repeat'
	Plug 'vbwx/vim-unimpaired'
	Plug 'ciaranm/detectindent'
	Plug 'jiangmiao/auto-pairs'
	Plug 'godlygeek/tabular'
	Plug 'tpope/vim-surround'
	Plug 'thinca/vim-visualstar'
	Plug 'maxbrunsfeld/vim-yankstack'
	Plug 'tkhren/vim-fake'
	Plug 'Valloric/YouCompleteMe', {'do': '/usr/bin/python install.py --tern-completer'}
	Plug 'Chiel92/vim-autoformat'
	Plug 'tpope/vim-commentary'
	Plug 'tmhedberg/matchit'
	"}}}

	"{{{ Snippets
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	"}}}

	"{{{ Language Support
	Plug 'mattn/emmet-vim'
	Plug 'isRuslan/vim-es6'
	Plug 'pangloss/vim-javascript'
	Plug 'lervag/vimtex'
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'vim-pandoc/vim-pandoc-syntax'
	Plug 'suan/vim-instant-markdown'
	" Plug 'gi1242/vim-multimarkdown'
	" Plug 'plasticboy/vim-markdown'
	" Plug 'leafgarland/typescript-vim'
	" Plug 'digitaltoad/vim-pug'
	" Plug 'kchmck/vim-coffee-script'
	" Plug 'lumiliet/vim-twig'
	" Plug 'mustache/vim-mustache-handlebars'
	"}}}

	"{{{ Revision Control
	Plug 'tpope/vim-fugitive'
	Plug 'sjl/gundo.vim'
	Plug 'mhinz/vim-signify'
	Plug 'idanarye/vim-merginal'
	Plug 'juneedahamed/svnj.vim'
	" Plug 'airblade/vim-gitgutter'
	"}}}

	call plug#end()
	call yankstack#setup()
"}}}

"{{{ Mappings
	" [Space] is the new leader key
	map <Space> <Leader>
	map <Leader><Space> <Localleader>
	imap <C-\> <C-O><Localleader>
	imap <C-Space> <C-O><Localleader>
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
	" Faster access to ex mode with [Return]
	noremap <CR> :
	" Faster shell command execution [Ctrl]+[Return]
	noremap <D-CR> :!
	" Adding lines in insert mode
	inoremap <D-CR> <C-O>o
	inoremap <S-CR> <C-O>O
	" Jump to tag with [Shift]+[Return]
	nnoremap <S-CR> <C-]>
	" Jump back with [Shift]+[Backspace] or [Backspace]
	nnoremap <S-BS> <C-T>
	nnoremap <BS> <C-T>
	" Ex mode is unnecessary
	nnoremap Q <NOP>
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
	nnoremap <silent> z/ :nohl<CR>
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

	" Reference the directory of the current file in ex commands
	cnoremap %/ %:p:h/
	" Fast ex command for global substitution
	cnoremap %s %s///g<Left><Left><Left>

	" Special mappings that require plugins
	if &loadplugins
		" Open a URI with [Cmd]+[Return]
		nmap <C-CR> <Plug>NetrwBrowseX
		imap <C-CR> <C-O><Plug>NetrwBrowseX
		xmap <C-CR> <Plug>NetrwBrowseXVis
		" Format buffer with [Space][=]
		nnoremap <Leader>= :Autoformat<CR>
		" Align words/operators/columns across multiple lines with [Space][,]
		noremap <Leader>, :Tabularize /
		" Move focus to file explorer with [Space][N]
		nnoremap <Leader>n :NERDTreeFocus<CR>
		" Change working directory of file explorer with [Space][Shift]+[N]
		nnoremap <Leader>N :NERDTreeCWD<CR>
		" Reveal current file in file explorer with [Space][%]
		nnoremap <Leader>% :NERDTreeFind<CR>
		" Move focus to Git explorer with [Space][G]
		nnoremap <Leader>g :Merginal<CR>
		" Move focus to tag bar with [Space][#]
		nnoremap <Leader># :TagbarOpen fj<CR>
		" Reveal current tag in tag bar with [Space][$]
		nnoremap <Leader>$ :TagbarShowTag<CR>
		" Check syntax with [Space][S]
		nnoremap <Leader>s :SyntasticCheck<CR>
		" Look up keyword in Dash with [Space][D]
		noremap <Leader>d :Dash<CR>
		" Look up keyword in all Dash docsets with [Space][Shift]+[D]
		noremap <Leader>D :Dash!<CR>
		" Show undo tree
		nnoremap <Leader>u :GundoShow<CR>
		" Set indentation settings with [Space][I]
		nnoremap <Leader>i :DetectIndent<CR>
		" Show mark positions when using jump command
		nnoremap <silent> ` :ShowMarksOnce<CR>`
		nnoremap <silent> ' :ShowMarksOnce<CR>'
		nnoremap <silent> g` :ShowMarksOnce<CR>g`
		nnoremap <silent> g' :ShowMarksOnce<CR>g'
		" Access yank history with [+] and [_] (or [-] on the numeric keyboard)
		nmap _ <Plug>yankstack_substitute_older_paste
		nmap + <Plug>yankstack_substitute_newer_paste
		nmap <KMinus> _
		nmap <KPlus> +
		" CtrlP shortcuts
		nnoremap <Leader>P :CtrlPMixed<CR>
		nnoremap <Leader>: :CtrlPCmdHistory<CR>
		nnoremap <Leader>. :CtrlPCurWD<CR>
		nnoremap <Leader>b :CtrlPBuffer<CR>
		nnoremap <Leader>r :CtrlPMRUFiles<CR>
		nnoremap <Leader>c :CtrlPChange<CR>
		nnoremap <Leader>C :CtrlPChangeAll<CR>
		nnoremap <Leader>l :nohl <Bar> CtrlPLine<CR>
		nnoremap <Leader>" :CtrlPRegister<CR>
		nnoremap <Leader>T :CtrlPTag<CR>
		nnoremap <Leader>t :CtrlPBufTagAll<CR>
		nnoremap <Leader>/ :nohl <Bar> CtrlPSearchHistory<CR>
		nnoremap <Leader>` :CtrlPMark<CR>
		nnoremap <Leader>h :CtrlPHelp<CR>
		nnoremap <Leader>A :CtrlPag<CR>
		xnoremap <Leader>A :CtrlPagVisual<CR>
		nnoremap <Leader>a :CtrlPagLocate<Space>
		nnoremap <Leader>? :CtrlPagPrevious<CR>
		nnoremap <Leader>@ :CtrlPBookmarkDir<CR>
		nnoremap <Leader>q :CtrlPQuickfix<CR>
		nnoremap <Leader><Tab> :CtrlPSmartTabs<CR>
		nnoremap <Leader><CR> :CtrlPCmdPalette<CR>
	endif
"}}}

"{{{ Syntax Highlighting
	colorscheme base16-tomorrow-night
	highlight! link ExtraWhitespace Todo
"}}}

"{{{ Auto Commands
	if has('autocmd')
		" Explore contents of JAR files
		autocmd BufReadCmd *.jar call zip#Browse(expand("<amatch>"))
		" Prevent comment insertion when inserting new lines; remove comment leader when joining lines and
		" add comment leader on [Return]
		autocmd FileType * setlocal formatoptions-=o formatoptions+=jr
		" Syntax specific formatting
		autocmd FileType tex setlocal formatoptions+=1
		autocmd FileType html setlocal formatoptions-=tc
		autocmd FileType text,markdown setlocal formatoptions+=n1
		" Save on losing focus
		" autocmd FocusLost * wa

		if &loadplugins
			" Allow traversing the tree upwards when navigating Git objects
			autocmd User fugitive
			\ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
			\	nnoremap <buffer> <BS> :edit %:h<CR> |
			\	nnoremap <buffer> <S-BS> :edit %:h<CR> |
			\ endif
			" Delete buffers when navigating Git objects
			autocmd BufReadPost fugitive://* set bufhidden=delete
			" Enable Emmet for HTML & CSS files
			autocmd FileType html,css EmmetInstall
		endif
	endif
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
	" Update tags file for JS projects
	command! GetJSTags ! find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > .tags
	" Open a Terminal window in the current working directory
	command! Term execute '! osascript -e $''tell application "Terminal"\nactivate\ndo script "cd \\"' . getcwd() . '\\""\nend tell'' > /dev/null'
"}}}

" vim: ts=5:sw=5:fdm=marker:fdl=0:fdc=3
