
"
" Plugins
"

call plug#begin("~/.vim/plugged")
  Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-gitgutter'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'editorconfig/editorconfig-vim'
  Plug 'flazz/vim-colorschemes' " A lot of colorschemes
  Plug 'honza/vim-snippets' " Code snippets
  Plug 'itchyny/vim-gitbranch' " Show git branch
  Plug 'khaveesh/vim-fish-syntax' " Syntax highlighting for .fish files
  Plug 'mattn/emmet-vim'
  Plug 'mhinz/vim-startify' " Start screen
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc, useful for coding
  Plug 'preservim/nerdcommenter' " Comment text with a keybinding
  Plug 'scrooloose/nerdtree' " File management
  Plug 'tmsvg/pear-tree' " Pair quotes, parentheses, HTML tags, etc.
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sleuth'
  Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
  Plug 'vim-airline/vim-airline' " Airline status
  Plug 'vim-airline/vim-airline-themes' " Airline themes ( requires vim-airline )
  Plug 'vim-syntastic/syntastic' " More syntax

  Plug 'ryanoasis/vim-devicons' " Nice icons, must be last plugin
call plug#end()

"
" Airline
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='atomic'

"
" fzf
"
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

"
" Toggle Nerd Tree for file management
"
map <C-n> :NERDTreeToggle<CR>

set expandtab
set tabstop=3
set shiftwidth=3

syntax enable
set termguicolors
colorscheme catppuccin
set background=dark
"hi Normal guibg=NONE ctermbg=NONE " Hide background color
