execute pathogen#infect()
call pathogen#helptags()
Helptags

set nocompatible              " be iMproved, required
filetype off                  " required





" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on


set tabstop=4 " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4

set number              " show line numbers

" Apply the indentation of the current line to the next line.
set autoindent      " copy indent from current line when starting a new line
set smartindent     " even better autoindent (e.g. add indent after '{')
set complete-=i
set showmatch
set smarttab

set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set ruler                       " Show the cursor position all the time
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_bold = 1
let g:solarized_contrast = "normal"
let g:solarized_termtrans=1
" let g:hybrid_use_Xresources = 1
" let g:rehash256 = 1
colorscheme solarized

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk


" load plugins

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0





