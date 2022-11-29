" Start up module
if has('filetype')
  filetype indent plugin on
endif
if has('mouse')
  set mouse=a
endif
if has('syntax')
  syntax on
endif

" Variables
set autoindent
set backspace=indent,eol,start
set clipboard=unnamedplus " Use system clipboard.
set cmdheight=2
set confirm " Ask for confirmation when quitting.
set cursorline " Highlight current line.
set encoding=UTF-8
"set expandtab " vim-sleuth
set foldcolumn=1
set hidden " Allows you to open multiple files at once.
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nocompatible " Disable compatibility to vi.
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set number " Show line numbers, use this and relativenumber to get relative line numbers.
set pastetoggle=<F11>
set ruler
"set shiftwidth=3 " vim-sleuth
set showcmd
set showmatch 
set smartcase
"set softtabstop=3 " vim-sleuth
set t_vb=
set ttyfast " Speed up scrolling.
set visualbell
set wildmode=longest,list " Get tab completions.

