if has('win32') || has('win64')
"{{{ Windows
	set guioptions=egmrLt
	set guifont=DejaVu_Sans_Mono_for_Powerline:h10
"}}}
else
"{{{ Unix
	set guioptions-=rL
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
"}}}
endif

" vim: ts=5:sw=5:ci:pi:fdm=marker:fdl=0
