"{{{ General
	set visualbell t_vb=
"}}}

if has('win32') || has('win64')
"{{{ Windows
	set guioptions=egmrLT
	set guifont=DejaVu_Sans_Mono_for_Powerline:h10
"}}}
elseif has('gui_macvim')
"{{{ macOS
	set guioptions-=rLT
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
"}}}
else
"{{{ *nix
	set guioptions-=T
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline 10
"}}}
endif

" vim: ts=5:sw=5:ci:pi:fdm=marker:fdl=0
