-- > Modules
require('plugins')
require('nvim_variables')

-- > Shorthands
local set = vim.opt

-- > Colorschemes
--	Some color settings may also be in the Neovide support section.
set.background = 'dark'
vim.g['everforest_background'] = 'hard'
vim.g['everforest_better_performance'] = 1

-- > Neovide support
if vim.g['neovide'] then
	-- >> Neovide-only settings

	--	Neovide options.
	vim.g['neovide_confirm_quit'] = true
	vim.g['neovide_cursor_animation_length'] = 0.15
	vim.g['neovide_cursor_trail_size'] = 0.05
	vim.g['neovide_cursor_vfx_mode'] = 'pixiedust'
	vim.g['neovide_cursor_vfx_particle_density'] = 30.0
	vim.g['neovide_hide_mouse_when_typing'] = true

	-- GUI options.
	set.guifont = 'Jetbrains_Mono:h10'
end

-- > Tab key
set.expandtab = true -- vim-sleuth
set.shiftwidth = 4 -- vim-sleuth
set.softtabstop = 4 -- vim-sleuth
set.tabstop = 4 -- vim-sleuth
set.wildmode = 'longest,list' -- Tab completions

-- > Plugin configuration
vim.g['fzf_layout'] = {window = {width = 0.8, height = 0.5, highlight = 'Comment'}}

-- >> Barbar
require('bufferline').setup {
	-- Icons
	icon_custom_colors = true,
	icon_separator_active = '|',
	icon_separator_inactive = '|',
	icon_close_tab = 'x',
	icon_close_tab_modified = '*',
	icon_pinned = 'v',
}

-- >> Git Signs
require('gitsigns').setup {
	signs = {
		add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
		change       = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
		delete       = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
		topdelete    = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
		changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
		untracked    = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
	}
}

-- >> Lualine
require('lualine').setup {
	options = {
		theme = 'rose-pine',
		section_separators = { left = '', right = '' },
	    component_separators = { left = '|', right = '|' },
	},
}

-- >> Treesitter
require('nvim-treesitter.configs').setup {
	highlight = { enable = true }
}

-- >> Rosé Pine
require('rose-pine').setup {
	dark_variant = 'main'
}
vim.cmd('colorscheme rose-pine')

-- > Keybinds
--[[
	==gi returns back to insert mode.
	<CR> is the return key.
]]
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', opts) -- Move the selected line up.
map('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', opts) -- Move the selected line down.

map('i', '<A-y>', '<Esc>:redo<CR>==gi', opts)
map('i', '<A-z>', '<Esc>:undo<CR>==gi', opts)

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-z>', 'za', opts)
map('n', '<Esc>', ':noh<Esc>', opts)
map('n', '<A-t>', ':tabnew<CR>', opts)

map('n', '<Leader>v', ':vsplit<CR>', opts)
map('n', '<Leader>h', ':split<CR>', opts)

-- >> Tab/buffer management
--	This uses `barbar.nvim`
-- Go to previous/next tab/buffer.
map('n', '<C-Left>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-Right>', '<Cmd>BufferNext<CR>', opts)

-- (Un)pin tab/buffer.
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Close tab/buffer.
map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)

-- Keybinds (vimscript)
--[[
	These are specifically for changing the CoC completion key to Tab.
	Couldn't figure out how to do this in Lua.
]]
vim.cmd('inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<TAB>"')
vim.cmd('inoremap <silent><expr> <CR> "\\<c-g>u\\<CR>"')
