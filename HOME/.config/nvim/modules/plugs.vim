
"
" Plugins
"

call plug#begin("~/.vim/plugged")
  Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-gitgutter'
  Plug 'morhetz/gruvbox'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'elkowar/yuck.vim' " .yuck EWW config language filetype support
  Plug 'fladson/vim-kitty' " kitty.conf syntax highlighting
  Plug 'flazz/vim-colorschemes' " A lot of colorschemes
  Plug 'honza/vim-snippets' " Code snippets
  Plug 'itchyny/vim-gitbranch' " Show git branch
  Plug 'khaveesh/vim-fish-syntax' " Syntax highlighting for .fish files
  Plug 'mattn/emmet-vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
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
  Plug 'zah/nim.vim' " Nim support

  Plug 'ryanoasis/vim-devicons' " Nice icons, must be last plugin
call plug#end()

"
" Airline
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='gruvbox'

"
" fzf
"
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

"
" Toggle Nerd Tree for file management
"
map <C-e> :NERDTreeToggle<CR>

set expandtab
set tabstop=3
set shiftwidth=3

syntax enable
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
