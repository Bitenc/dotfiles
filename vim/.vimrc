" Thibault's vimrc
" with inspiration of https://github.com/Wayneoween/dotfiles

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
    "enable mouse support
    set mouse=a
 
    "Renaming xterm window
    set title
    "Don't show line numbers
    set nonumber
    "Always show the status bar
    set laststatus=2
	
" }

" vim-plug setup {
    call plug#begin('~/.vim/plugged')
   
    " start screen for vim
    " https://vimawesome.com/plugin/vim-startify
    Plug 'mhinz/vim-startify'

    " Solarized Colorscheme for vim
	" https://vimawesome.com/plugin/vim-colors-solarized-ours
	Plug 'altercation/vim-colors-solarized'

    " a nice statusline at the bottom for vim
    " https://vimawesome.com/plugin/vim-airline-superman
    Plug 'vim-airline/vim-airline'

    " theme repository for vim-airline
    " https://vimawesome.com/plugin/vim-airline-themes
    Plug 'vim-airline/vim-airline-themes'
	
	" shows a git diff in the 'gutter' (sign column)
	" https://vimawesome.com/plugin/vim-gitgutter
	Plug 'airblade/vim-gitgutter'


    " Features and enhancements
    " {

        " https://vimawesome.com/plugin/youcompleteme code completion
		Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

        " https://editorconfig.org plugin for vim
        " https://vimawesome.com/plugin/editorconfig-vim
        " Plug 'editorconfig/editorconfig-vim'

        " file system explorer for vim
        " https://vimawesome.com/plugin/nerdtree-red
        Plug 'scrooloose/nerdtree'

        " user-configurable modeline support for vim
        " https://vimawesome.com/plugin/securemodelines
        " Plug 'ciaranm/securemodelines'

        " to comment stuff out in vim
        " https://vimawesome.com/plugin/commentary-vim
        Plug 'tpope/vim-commentary'

        " surroundings: parentheses, brackets, quotes, XML tags
        " https://vimawesome.com/plugin/surround-vim
        " Plug 'tpope/vim-surround'

        " changes the working directory to the project root
        " https://vimawesome.com/plugin/rooter
        Plug 'airblade/vim-rooter'

        " NERDTree showing git status flags
        " https://vimawesome.com/plugin/nerdtree-git-plugin
        Plug 'Xuyuanp/nerdtree-git-plugin'

    " }

    " Initialize plugin system
    call plug#end()
" }

" General {
    " Appearance {
        set so=10
        set number
	
        " solarized appearance	
        syntax enable
        set background=dark
        let g:solarized_termcolors=256
        colorscheme solarized

        " lineNr appearance
        hi LineNr ctermfg=grey
        hi CursorLine cterm=NONE ctermbg=black
        hi CursorLineNr cterm=NONE ctermfg=grey ctermbg=black
        set cursorline

    " }

    " Indentation{
        "One Tab per indentation level. 4 column wide Tabs.
        "Intelligently detect current indentation level 
        set autoindent
        "Size of real Tabs
        set tabstop=4
        "Indent amount when using TAB
        set softtabstop=4
        "Indent amount when using cindent,>>, ..
        set shiftwidth=4
        ""Do not expand tabs to spaces
        set noexpandtab        
    " }

    " Tab completion {
        set wildmenu
        set wildmode=list:longest,list:full
        set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
    " }

" }

" Settings for addons {

    " vim-gitgutter {
        let g:gitgutter_enabled = 1
        highlight SignColumn ctermfg=239 ctermbg=235 guifg=Yellow
        highlight GitGutterAdd ctermfg=2 ctermbg=235 guifg=#009900
        highlight GitGutterChange ctermfg=3 ctermbg=235 guifg=#bbbb00
        highlight GitGutterDelete ctermfg=1 ctermbg=235 guifg=#ff2222
        nmap <leader>j <Plug>GitGutterNextHunk
        nmap <leader>k <Plug>GitGutterPrevHunk
        " Decrease amount of executions
        "let g:gitgutter_eager = 0
    " }

    " NERDtree {
         " Autostart NERDtree when opening an empty buffer
         "autocmd StdinReadPre * let s:std_in=1
         "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
         let g:NERDTreeNodeDelimiter = "\u00a0"
         let g:NERDTreeHijackNetrw = 0
         let g:NERDTreeMouseMode=3

         " Close vim if NERDtree is only window
         autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

         " https://github.com/scrooloose/nerdtree/issues/480
         function! NERDTreeToggleInCurDir()
             " If NERDTree is open in the current buffer
             if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
                 exe ":NERDTreeClose"
             else
                 if (expand("%:t") != '')
                     exe ":NERDTreeFind"
                 else
                     exe ":NERDTreeToggle"
                 endif
             endif
         endfunction

         " Toggle NERDtree with CTRL-e
         nnoremap <C-e> :call NERDTreeToggleInCurDir()<CR>
    " }

    " Airline.vim {
	    "don't show second status line for vim-airline
        set noshowmode

	    augroup airline_config
            autocmd!
            let g:airline_theme='solarized'
            let g:airline_powerline_fonts = 1
            let g:airline_enable_syntastic = 1
            let g:airline#extensions#tabline#buffer_nr_format = '%s '
            let g:airline#extensions#tabline#buffer_nr_show = 1
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#fnamecollapse = 0
            let g:airline#extensions#tabline#fnamemod = ':t'
        augroup END
    " }

" }

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
