call plug#begin("~/.vim/plugged")
  " Auto Complete
  Plug 'tmsvg/pear-tree'
  
  " Syntax
  Plug 'vim-syntastic/syntastic'
  Plug 'fladson/vim-kitty'

  " Snippets
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Color Schemes
  Plug 'dracula/vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}

  " Other
  Plug 'scrooloose/nerdtree' " File management in (neo)vim
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify' " Nice start screen
  Plug 'tpope/vim-sleuth'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mattn/emmet-vim'
  Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
  Plug 'nathanaelkane/vim-indent-guides'
 
  " Status Bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes' 
  "Plug 'itchyny/lightline.vim'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/vim-gitbranch'

  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Icons
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" If using LightLine
let g:lightline = {'active': {'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ], 'right': [ [ 'lineinfo' ],[ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ] }}


" If using AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='atomic'

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

set expandtab
set tabstop=3
set shiftwidth=3

" color schemes
syntax enable
"colorscheme evening
set termguicolors
colorscheme catppuccin
set background=dark
"hi Normal guibg=NONE ctermbg=NONE
