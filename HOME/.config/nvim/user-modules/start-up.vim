"
" Start up module
"
if has('filetype')
  filetype indent plugin on
endif
if has('mouse')
  set mouse=a
endif
if has('syntax')
  syntax on
endif

"
" Set
"
set autoindent " Automatic indentation
set backspace=indent,eol,start
set clipboard=unnamedplus " Use system clipboard
set cmdheight=2
set confirm " Confirm when quitting ( i.e if you do :q on an unsaved file, it will ask if you'd really want to quit )
set cursorline " Highlight current line
set encoding=UTF-8
set expandtab
set foldcolumn=1
set hidden
set hlsearch
set ignorecase
set incsearch " Incremental search
set laststatus=2
set nocompatible " Disable compatibility to vi
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set number " Show line numbers, use this + relativenumber to get relative line numbers
set pastetoggle=<F11>
set ruler
set shiftwidth=3
set showcmd
set showmatch 
set smartcase
set softtabstop=3 
set t_vb=
set ttyfast " Speed up scrolling in vim
set visualbell
set wildmode=longest,list     " get bash-like tab completions

