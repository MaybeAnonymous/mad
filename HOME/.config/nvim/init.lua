-- This configuration for Neovim is experimental.

-- Variables
local Plug = vim.fn['plug#']
local set = vim.opt

-- Runtime
-- set.runtimepath = set.runtimepath

-- Plugins
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale' -- Linting
Plug 'editorconfig/editorconfig-vim' -- Support for .editorconfig files.
Plug 'fladson/vim-kitty' -- Support for kitty.conf.
Plug 'honza/vim-snippets'
Plug 'khaveesh/vim-fish-syntax' -- Support for .fish files.
Plug ('mg979/vim-visual-multi', {branch = 'master'})
Plug 'mhinz/vim-startify' -- Start screen.
Plug ('neoclide/coc.nvim', {branch = 'release'}) -- VSCode-like code completion.
Plug 'preservim/nerdcommenter' -- Automatic text commenter.
Plug 'scrooloose/nerdtree' -- Tree file management.
Plug 'tmsvg/pear-tree' -- Pair quotes, parentheses, HTML tags, etc.
Plug 'tpope/vim-fugitive' -- Good git support.
Plug 'tpope/vim-sleuth' -- Indentation management.
Plug('turbio/bracey.vim', {['do'] = 'npm install --prefix server'}) -- Live-edit HTML, CSS and JS.
Plug 'vim-airline/vim-airline' -- A status bar.
Plug 'vim-airline/vim-airline-themes'

-- This must be the last plugin.
Plug 'ryanoasis/vim-devicons'
vim.call('plug#end')

-- Neovim variables
if vim.fn.has('mouse') then
	set.mouse = 'a'
end

if vim.fn.has('syntax') then
	vim.syntax = 'on'
end

set.autoindent = true
set.backspace = 'indent,eol,start'
set.clipboard = 'unnamedplus' -- Use system clipboard.
set.cmdheight = 2
set.confirm = true -- Ask for confirmation when quitting Neovim.
set.cursorline = true -- Highlight selected line.
set.encoding = 'UTF-8'
set.foldcolumn = '1'
set.foldlevel = 99
set.foldmethod = 'syntax'
set.hidden = true -- Open multiple files at once
set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.laststatus = 2
set.compatible = false
set.startofline = false
set.timeout = false
set.number = true -- Show line numbers
set.pastetoggle = '<F11>'
set.ruler = true
set.showcmd = true
set.showmatch = true
set.smartcase = true
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.ttimeout = true
set.ttimeoutlen = 200
set.ttyfast = true -- Speed up scrolling
set.visualbell = true

-- Airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline_powerline_fonts'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'default'
vim.g['airline_theme'] = 'gruvbox'

-- Color scheme (vimscript)
vim.cmd('colorscheme gruvbox')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

-- Tabs
set.expandtab = true -- vim-sleuth
set.shiftwidth = 4 -- vim-sleuth
set.softtabstop = 4 -- vim-sleuth
set.tabstop = 4 -- vim-sleuth
set.wildmode = 'longest,list' -- Tab completions

-- Other plugin variables
vim.g['fzf_layout'] = {window = {width = 0.8, height = 0.5, highlight = 'Comment'}}
vim.g['gruvbox_italic'] = 1

-- Keybinds
--[[
	==gi returns back to insert mode.
	<CR> is the return key.
]]
local map = vim.keymap.set

map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', {silent = true}) -- Move the selected line up.
map('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', {silent = true}) -- Move the selected line down.

map('i', '<A-y>', '<Esc>:redo<CR>==gi', {silent = true})
map('i', '<A-z>', '<Esc>:undo<CR>==gi', {silent = true})

map('n', '<C-Left>', ':tabprevious<CR>', {silent = true})
map('n', '<C-q>', ':bd<CR>', {silent = true})
map('n', '<C-Right>', ':tabnext<CR>', {silent = true})
map('n', '<C-s>', ':w<CR>', {silent = true})
map('n', '<C-z>', 'za', {silent = true})
map('n', '<Esc>', ':noh<Esc>', {silent = true})
map('n', '<A-t>', ':tabnew<CR>', {silent = true})

-- Augroup (vimscript)
vim.cmd [[
:augroup open-tabs
:	au!
:	" tab all: set everything to tabs.
:	" tabfirst: focus on first tab.
:	au VimEnter * ++nested if !&diff | tab all | tabfirst | endif
:augroup end
]]