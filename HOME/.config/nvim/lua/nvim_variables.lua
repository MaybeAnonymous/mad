-- Shorthands
local set = vim.opt
local seto = vim.o

-- > Neovim variables
if vim.fn.has('filetype') then
	vim.cmd('filetype indent plugin on')
end

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
set.foldenable = false
seto.foldexpr = 'nvim_treesitter#foldexpr()'
set.foldlevel = 99
seto.foldmethod = 'expr'
set.hidden = true -- Open multiple files at once.
set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.laststatus = 2
set.compatible = false
set.startofline = false
set.timeout = false
set.number = true -- Show line numbers.
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
set.ttyfast = true -- Speed up scrolling.
set.visualbell = true