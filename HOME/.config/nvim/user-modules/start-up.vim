" Start Up settings for NeoVim

if has('filetype')
  filetype indent plugin on
endif

if has('mouse')
  set mouse=a
endif

if has('syntax')
  syntax on
endif

set backspace=indent,eol,start
set clipboard=unnamedplus     " using system clipboard
set cmdheight=2
set confirm
set cursorline                " highlight line below cursor
set encoding=UTF-8
set hidden
set hlsearch                  " highlight search 

set ignorecase
set smartcase

set incsearch                 " incremental search
set laststatus=2
set nocompatible              " disable compatibility to vi
set nostartofline

set notimeout ttimeout ttimeoutlen=200

set number
set relativenumber

set pastetoggle=<F11>
set ruler
set showcmd
set showmatch 
set ttyfast                   " Speed up scrolling in Vim

set visualbell
set t_vb=

set wildmode=longest,list     " get bash-like tab completions

"Tabs
set autoindent
set shiftwidth=3
set softtabstop=3 
set expandtab

