"{{{ Settings
	set nocompatible
	set number
	set hidden
	set showmatch
	set hlsearch
	set ignorecase
	set smartcase
	set wildmenu
	set autoread
	set showcmd
	set copyindent
	set preserveindent
	set modeline
	set modelines=3
	set foldmethod=indent
	set foldlevelstart=99
	set wildignore=.git,.svn,.sass-cache,.tmp,.temp,.DS_Store,Thumbs.db,._*
	set encoding=utf-8
	set spelllang=de
	set formatoptions-=o
	set listchars=tab:┆\ ,nbsp:·
	set tabstop=4
	set shiftwidth=4
	set softtabstop=0
	set laststatus=2
	set mouse=a
	set selectmode=mouse

	let g:session_autosave = 'no'
	let g:solarized_menu = 0
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:bufferline_show_bufnr = 0
	let g:bufferline_echo = 0
	let g:indentLine_char = '┆'
	let g:indentLine_enabled = 0
	let g:syntastic_mode_map = {
	\	'mode': 'passive',
	\	'active_filetypes': []
	\ }
"}}}

"{{{ Mappings
	" [Space] is the new leader key
	map <Space> <Leader>
	" Faster access to ex mode with [Return]
	noremap <CR> :
	ounmap <CR>
	" Faster shell command execution [Ctrl]+[Return]
	noremap <C-CR> :!
	ounmap <C-CR>
	" Adding lines in insert mode
	inoremap <C-CR> <Esc>o
	inoremap <S-CR> <Esc>O
	" Jump to definition with [Shift]+[Return]
	nnoremap <S-CR> <C-]>
	" Jump back with [Backspace]
	nnoremap <BS> <C-T>
	nnoremap <S-BS> <C-T>
	" Open a URI with [Alt]+[Return]
	nmap <A-CR> gx
	xmap <A-CR> gx
	" Switching between tabs
	nnoremap <silent> <C-Tab> :tabnext<CR>
	nnoremap <silent> <C-S-Tab> :tabprevious<CR>
	" Switching between buffers
	nnoremap <silent> <Leader><Left> :bprevious!<CR>
	nnoremap <silent> <Leader><Right> :bnext!<CR>
	" Switching between windows
	noremap <C-Down> <C-W>j
	noremap <C-Up> <C-W>k
	noremap <C-Left> <C-W>h
	noremap <C-Right> <C-W>l
	" Close a window with [Ctrl]+[C]
	noremap <C-C> <C-W>c
	" Close a buffer with [Space][Q]
	nnoremap <silent> <Leader>q :bdelete<CR>
	" Discard a buffer with [Space][Shift]+[Q]
	nnoremap <silent> <Leader>Q :bdelete!<CR>
	" Clear search highlighting with [Space][/]
	nnoremap <Leader>/ :nohl<CR>
	" Redraw screen & syntax highlighting with [Ctrl]+[L]
	nnoremap <silent> <C-L> <C-L>:syntax sync fromstart<CR>
	" Toggle folds with [Tab]
	nnoremap <Tab> za
	" Copy into the system clipboard with [Space][Y]
	xnoremap <Leader>y "*y
	nnoremap <Leader>y "*y
	" Paste from the system clipboard with [Space][P]
	nnoremap <Leader>p :set paste<CR>o<Esc>"*]p:set nopaste<CR>

	" Special mappings that require plugins
	if &loadplugins
		" Format buffer with [Space][F]
		nnoremap <Leader>f :Autoformat<CR>
		" Show indentation lines with [Space][Tab]
		nnoremap <silent> <Leader><Tab> :set invlist<CR>:IndentLinesToggle<CR>
	else
		" Show indentation lines with [Space][Tab]
		nnoremap <silent> <Leader><Tab> :set invlist<CR>
	endif
"}}}

"{{{ Bundles
	if has('win32') || has('win64')
		let $VIMHOME = $HOME."\\vimfiles"
	else
		let $VIMHOME = $HOME."/.vim"
	endif
	filetype off
	set rtp+=$VIMHOME/bundle/Vundle.vim
	call vundle#begin()

"{{{ Tools
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'sjl/gundo.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'Shougo/unite.vim'
"}}}

"{{{ User Interface
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'chriskempson/base16-vim'
"}}}

"{{{ Editing
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'editorconfig/editorconfig-vim'
	Plugin 'SirVer/ultisnips'
	Plugin 'tmhedberg/matchit'
	Plugin 'mattn/emmet-vim'
	Plugin 'Yggdroot/indentLine'
	Plugin 'godlygeek/tabular'
"}}}

"{{{ Syntax
	Plugin 'digitaltoad/vim-pug'
	Plugin 'kchmck/vim-coffee-script'
	Plugin 'isRuslan/vim-es6'
	Plugin 'mustache/vim-mustache-handlebars'
	Plugin 'leafgarland/typescript-vim'
"}}}

"{{{ Integration
	Plugin 'scrooloose/syntastic'
	Plugin 'rizzatti/dash.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'vim-scripts/vim-svngutter'
	Plugin 'suan/vim-instant-markdown'
	Plugin 'Chiel92/vim-autoformat'
	Plugin 'Valloric/YouCompleteMe'
"}}}

	call vundle#end()

	filetype plugin indent on
"}}}

"{{{ Syntax Highlighting
	syntax enable
	" Highlight trailing whitespace
	match Todo /\s\+$/
	colorscheme base16-tomorrow-night
"}}}

"{{{ Functions
fun! s:StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
"}}}

"{{{ Auto Commands
autocmd BufWritePre * call s:StripTrailingWhitespaces()
autocmd BufReadCmd *.jar call zip#Browse(expand("<amatch>"))
"}}}

" vim: ts=5:sw=5:ci:pi:fdm=marker:fdl=0
