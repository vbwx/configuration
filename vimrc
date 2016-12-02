" Copyright 2016 Bernhard Waldbrunner

"{{{ Settings
	set number
	set showmatch
	set hlsearch
	set ignorecase
	set smartcase
	set wildmenu
	set autoread
	set autowrite
	set showcmd
	set copyindent
	set preserveindent
	set modeline
	set noerrorbells visualbell t_vb=
	set modelines=3
	set foldmethod=indent
	set foldlevelstart=99
	set wildignore=.git,.svn,.sass-cache,.tmp,.temp,.DS_Store,Thumbs.db,.tags,._*
	set encoding=utf-8
	set spelllang=en
	set listchars=tab:┆\ ,nbsp:·
	set tabstop=4
	set shiftwidth=0
	set softtabstop=0
	set textwidth=100
	set laststatus=2
	set mouse=a
	set selectmode=mouse
	set tags=./.tags,.tags;$HOME

	let $VIMHOME = expand('<sfile>:p:h')
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
	let g:EditorConfig_exclude_patterns = ['fugitive://.*']
	let g:visualstar_extra_commands = 'zzzv'
	let g:user_emmet_install_global = 0
	let g:user_emmet_mode = 'nv'
	let g:user_emmet_leader_key = maplocalleader
	if executable('ag')
		let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
		\	--ignore .git
		\	--ignore .svn
		\	--ignore .hg
		\	--ignore .DS_Store
		\	--ignore Thumbs.db
		\	--ignore "**/*.pyc"
		\	-g ""'
	endif
"}}}

"{{{ Mappings
	" [Space] is the new leader key
	map <Space> <Leader>
	map <Leader><Space> <Localleader>
	imap <C-\> <C-O><Localleader>
	imap <C-Space> <C-O><Localleader>
	" Move to the end of the next line with [_]
	noremap _ j$
	" [Ctrl]+[C] doesn't trigger InsertLeave autocommands, so we map it to [Esc]
	inoremap <C-C> <Esc>
	vnoremap <C-C> <Esc>
	" Close a window with [Ctrl]+[C]
	nnoremap <C-C> <C-W>c
	" Faster access to ex mode with [Return]
	noremap <CR> :
	ounmap <CR>
	" Faster shell command execution [Ctrl]+[Return]
	noremap <C-CR> :!
	ounmap <C-CR>
	" Adding lines in insert mode
	inoremap <C-CR> <C-O>o
	inoremap <S-CR> <C-O>O
	" Jump to definition with [Shift]+[Return]
	nnoremap <S-CR> <C-]>
	" Jump back with [Shift]+[Backspace] or [Backspace]
	nnoremap <S-BS> <C-T>
	nnoremap <BS> <C-T>
	" Write & close a tab with [Shift]+[Z][Shift]+[Tab]
	nnoremap <silent> Z<S-Tab> :<C-R>=&mod ? 'w \| ' : ''<CR>tabclose<CR>
	" Close a tab with [Shift]+[Q][Shift]+[Tab]
	nnoremap <silent> Q<S-Tab> :tabclose!<CR>
	" Open a new tab with [Z][Tab]
	nnoremap <silent> z<Tab> :tabnew<CR>
	" Switching between tabs
	nnoremap <silent> [<Tab> :tabprevious<CR>
	nnoremap <silent> ]<Tab> :tabnext<CR>
	nnoremap <silent> [<S-Tab> :tabfirst<CR>
	nnoremap <silent> ]<S-Tab> :tablast<CR>
	" Switching between windows
	nnoremap <C-Down> <C-W>j
	nnoremap <C-Up> <C-W>k
	nnoremap <C-Left> <C-W>h
	nnoremap <C-Right> <C-W>l
	" Ex mode is unnecessary
	nnoremap Q <NOP>
	" Save & close a buffer with [Shift]+[Q][Shift]+[Q]
	nnoremap QQ :<C-R>=&mod ? 'w \| ' : ''<CR>bdelete<CR>
	" Discard changes in a buffer with [Shift]+[Q][Shift]+[Z]
	nnoremap QZ :bdelete!<CR>
	" Redraw screen & syntax highlighting with [Ctrl]+[L]
	nnoremap <silent> <C-L> <C-L>:syntax sync fromstart<CR>
	" Toggle folds with [Tab]
	nnoremap <Tab> za
	" Toggle folds recursively with [Z][Tab]
	nnoremap z<Tab> zA
	" Shortcut for :diffupdate
	nnoremap du :diffupdate<CR>
	" Automatically open folds when jumping to a line
	nnoremap G Gzv
	" Clear search highlighting with [Z][/]
	nnoremap <silent> z/ :nohl<CR>
	" Toggle the fold column with [Z][|]
	nnoremap <silent> z<Bar> :set fdc=<C-R>=&fdc == 0 ? 4 : 0<CR><CR>
	" Copy into the system clipboard with [G][Y]
	nnoremap gy "*y
	xnoremap gy "*y
	nnoremap gY "*yy
	xnoremap gY "*y
	" Cut into the system clipboard with [G][M]
	nnoremap gr "*d
	xnoremap gr "*d
	nnoremap gR "*dd
	xnoremap gR "*d
	" Don't leave visual mode when shifting lines
	vnoremap <silent> > >gv
	vnoremap <silent> < <gv
	" Reference the directory of the current file in ex commands
	cnoremap %/ %:p:h/

	" Special mappings that require plugins
	if &loadplugins
		" Paste from the system clipboard with [G][P]
		nmap gp "*=p
		xmap gp "*=p
		nmap gP "*=P
		xmap gP "*=P
		" Additional settings
		nnoremap [oI :set incsearch<CR>
		nnoremap ]oI :set noincsearch<CR>
		nnoremap coI :set incsearch!<CR>
		" Open a URI with [\][Return]
		nmap <Leader><CR> <Plug>NetrwBrowseX
		vmap <Leader><CR> <Plug>NetrwBrowseXVis
		" Format buffer with [Space][=]
		nnoremap <Leader>= :Autoformat<CR>
		" Align words/operators/columns across multiple lines with [Space][,]
		noremap <Leader>, :Tabularize /
		ounmap <Leader>,
		" Move focus to file explorer with [Space][N]
		nnoremap <Leader>n :NERDTreeFocus<CR>
		" Change working directory of file explorer with [Space][Shift]+[N]
		nnoremap <Leader>N :NERDTreeCWD<CR>
		" Reveal current file in file explorer with [Space][%]
		nnoremap <Leader>% :NERDTreeFind<CR>
		" Move focus to tag bar with [Space][T]
		nnoremap <Leader>t :TagbarOpen fj<CR>
		" Reveal current tag in tag bar with [Space][Shift]+[T]
		nnoremap <Leader>T :TagbarShowTag<CR>
		" Check syntax with [Space][S]
		nnoremap <Leader>s :SyntasticCheck<CR>
		" Look up keyword in Dash with [Space][D]
		noremap <Leader>d :Dash<CR>
		ounmap <Leader>d
		" Look up keyword in all Dash docsets with [Space][Shift]+[D]
		noremap <Leader>D :Dash!<CR>
		ounmap <Leader>D
		" Show indentation lines with [\][|]
		nnoremap <Leader><Bar> :IndentLinesToggle<CR>
		" Show undo tree
		nnoremap <Leader>u :GundoShow<CR>
		" Set indentation settings with [Space][I]
		nnoremap <Leader><Tab> :DetectIndent<CR>
		" Surround words with quotes
		nmap <Leader>" ysiW"
		nmap <Leader>' ysiW'
		nmap <Leader>` ysiW`
	else
		" Paste from the system clipboard with [G][P]
		nnoremap gp "*gp
		xnoremap gp "*gp
		nnoremap gP "*gP
		xnoremap gP "*gP
	endif
"}}}

"{{{ Bundles
	call plug#begin()

"{{{ User Interface
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'chriskempson/base16-vim'
"}}}

"{{{ Viewing
	Plug 'Yggdroot/indentLine'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'suan/vim-instant-markdown'
"}}}

"{{{ Tools
	Plug 'scrooloose/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'mattn/ctrlp-mark'
	Plug 'mattn/ctrlp-register'
	Plug 'tacahiroy/ctrlp-funky'
	Plug 'sgur/ctrlp-extensions.vim'
	Plug 'lokikl/vim-ctrlp-ag'
	Plug 'ivalkeen/vim-ctrlp-tjump'
	Plug 'majutsushi/tagbar'
	Plug 'rizzatti/dash.vim'
	Plug 'scrooloose/syntastic'
	Plug 'editorconfig/editorconfig-vim'
"}}}

"{{{ Editing
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-unimpaired'
	Plug 'ciaranm/detectindent'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tmhedberg/matchit'
	Plug 'mattn/emmet-vim'
	Plug 'godlygeek/tabular'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'Chiel92/vim-autoformat'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'thinca/vim-visualstar'
	Plug 'Valloric/YouCompleteMe', {'do': '/usr/bin/python install.py --tern-completer'}
"}}}

"{{{ Syntax
	Plug 'digitaltoad/vim-pug'
	Plug 'kchmck/vim-coffee-script'
	Plug 'isRuslan/vim-es6'
	Plug 'mustache/vim-mustache-handlebars'
	Plug 'leafgarland/typescript-vim'
"}}}

"{{{ Revision Control
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-scripts/vim-svngutter'
	Plug 'sjl/gundo.vim'
"}}}

	call plug#end()
"}}}

"{{{ Syntax Highlighting
	syntax enable
	highlight! link ExtraWhitespace Todo
	colorscheme base16-tomorrow-night
"}}}

"{{{ Installation
if !has('win32') && !has('win64')
	let file = $VIMHOME."/autoload/plug.vim"
	if empty(glob(file))
		silent exe "!curl -fLo ".file." --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
	endif

	let file = $VIMHOME."/spell/de.utf-8.spl"
	if empty(glob(file))
		silent exe "!curl -fLo ".file." --create-dirs 'http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.spl'"
	endif
endif
"}}}

"{{{ Auto Commands
" Explore contents of JAR files
autocmd BufReadCmd *.jar call zip#Browse(expand("<amatch>"))
" Prevent comment insertion when inserting new lines; remove comment leader when joining lines and
" add comment leader on [Return]
autocmd FileType * setlocal formatoptions-=o formatoptions+=jr
" Syntax specific formatting
autocmd FileType tex setlocal formatoptions+=1
autocmd FileType text,markdown setlocal formatoptions+=n1

if &loadplugins
	" Allow traversing the tree upwards when navigating Git objects
	autocmd User fugitive
	\	if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
	\		nnoremap <buffer> <BS> :edit %:h<CR> |
	\		nnoremap <buffer> <S-BS> :edit %:h<CR> |
	\	endif
	" Delete buffers when navigating Git objects
	autocmd BufReadPost fugitive://* set bufhidden=delete
	" Enable Emmet for HTML & CSS files
	autocmd FileType html,css EmmetInstall
	autocmd BufWritePre * StripWhitespace
endif
"}}}

"{{{ Custom Commands
" Update tags file for JS projects
command! GetJSTags ! find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > .tags
"}}}

" vim: ts=5:sw=5:ci:pi:fdm=marker:fdl=0:fdc=3
