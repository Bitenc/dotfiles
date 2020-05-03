" Basic {
    "Use vim defaults
    set nocompatible
    "Disable filetype detection during init
    filetype plugin on
    "Enable Syntax highlighting
    syntax enable
    "Explicitly define xterm as environment
    behave xterm
    "More screen updates
    set ttyfast
    "Enable modelines, secured by ciaranm/securemodelines
    set modeline
    "No exec
    set secure
    "Encoding
    set encoding=utf-8
    "Remove splash screen
    set shortmess+=I
    "Function of the backspace key
    set backspace=indent,eol,start
    "Don't use swap files
    set noswapfile
    "Use this specific term env
    set term=xterm-256color
    set t_RV=
" }

" vim-plug setup {
    call plug#begin('~/.vim/plugged')
   
        " start screen for vim
        " https://vimawesome.com/plugin/vim-startify
        Plug 'mhinz/vim-startify'

        " Solarized Colorscheme for vim
	" https://vimawesome.com/plugin/vim-colors-solarized-ours
	Plug 'altercation/vim-colors-solarized'

    " Initialize plugin system
    call plug#end()
" }

" General {
    " Appearance {
        set so=999
        set number
		
	syntax enable
	set background=dark
	let g:solarized_termcolors=256
	colorscheme solarized

        hi LineNr ctermfg=grey
        hi CursorLine cterm=NONE ctermbg=black
        hi CursorLineNr cterm=NONE ctermfg=grey ctermbg=black
        set cursorline
	
    " }
" }

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
