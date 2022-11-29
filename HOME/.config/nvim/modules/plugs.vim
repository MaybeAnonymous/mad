" Plugins
call plug#begin("~/.vim/plugged")
  Plug 'airblade/vim-gitgutter' " Show what changed in a file in a git repo.
  Plug 'morhetz/gruvbox'
  Plug 'dense-analysis/ale' " Linting
  Plug 'editorconfig/editorconfig-vim' " Support for .editorconfig files.
  Plug 'fladson/vim-kitty' " Support for kitty.conf.
  Plug 'itchyny/vim-gitbranch' " Show current git branch. -- May be removed as there is already vim-fugitive.
  Plug 'khaveesh/vim-fish-syntax' " Support for .fish files.
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'mhinz/vim-startify' " Start screen.
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " VSCode-like code completion.
  Plug 'preservim/nerdcommenter' " Automatic text commenter.
  Plug 'scrooloose/nerdtree' " Tree file management.
  Plug 'tmsvg/pear-tree' " Pair quotes, parentheses, HTML tags, etc.
  Plug 'tpope/vim-fugitive' " Good git support.
  Plug 'tpope/vim-sleuth' " Indentation management.
  Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} " Live-edit HTML, CSS and JS.
  Plug 'vim-airline/vim-airline' " A status bar.
  Plug 'vim-airline/vim-airline-themes'

  " This must be the last plugin.
  Plug 'ryanoasis/vim-devicons' 
call plug#end()

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='gruvbox'

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

" NERDTree
" - Toggle Nerd Tree for file management
map <C-e> :NERDTreeToggle<CR>

" Coc
" - Set completion confirmer to tab instead of enter.
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" This is handled by vim-sleuth.
"set expandtab
"set tabstop=3
"set shiftwidth=3

syntax enable
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
" set background=dark

" Make the background the same as the terminal's.
" Remove this if you use a Neovim GUI like Neovide.
hi Normal guibg=NONE ctermbg=NONE
