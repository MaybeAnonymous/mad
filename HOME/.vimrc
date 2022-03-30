"
" .vimrc | for vim, not neovim
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
" Main settings
"
nnoremap <C-L> :nohl<CR><C-L>
set autoindent
set backspace=indent,eol,start
set cmdheight=2
set confirm
set encoding=UTF-8
set expandtab
set hidden
set hlsearch
set ignorecase
set laststatus=2
set nocompatible
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set number
set pastetoggle=<F11>
set ruler
set shiftwidth=4
set showcmd
set smartcase
set softtabstop=4 
set t_vb=
set ttymouse=xterm2
set visualbell
set wildmenu
set wildmode=longest,list

"
" Other
"
autocmd FileType json syntax match Comment +\/\/.\+$+
set foldlevel=99
set foldmethod=syntax
set splitbelow
set splitright

"
" Keybindings
"
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <silent> <A-y> <Esc>:redo<CR>==gi
inoremap <silent> <A-z> <Esc>:undo<CR>==gi
nnoremap <silent> <C-Q> :bd<CR>
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-z> za
nnoremap <silent> <esc> :noh<CR><esc>
