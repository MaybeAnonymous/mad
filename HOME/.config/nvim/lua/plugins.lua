-- Before plugins are loaded
vim.g['ale_disable_lsp'] = 1

vim.cmd [[packadd packer.nvim]]

-- > Plugin installation
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself.

    use 'dense-analysis/ale' -- Code linting.
    use 'editorconfig/editorconfig-vim' -- Support for .editorconfig files.
    use 'fladson/vim-kitty' -- Support for kitty.conf.
    use 'honza/vim-snippets' -- Some snippets.
    use 'mhinz/vim-startify' -- Start screen.
    use 'sainnhe/everforest' -- Everforest colorscheme.
    use 'preservim/nerdcommenter' -- Automatic text commenter.
    use 'scrooloose/nerdtree' -- Tree file management.
    use 'tmsvg/pear-tree' -- Pair quotes, parentheses, HTML tags, etc.
    use 'tpope/vim-sleuth' -- Indentation management.
    use {'mg979/vim-visual-multi', branch = 'master'}
    use {'neoclide/coc.nvim', branch = 'release'} -- VSCode-like code completion.

    -- >> Git-related plugins
    use 'lewis6991/gitsigns.nvim' -- Git Decorations
    use 'tpope/vim-fugitive' -- Git command support.

    -- >> Barbar - Tab/bufferline.
    use {
        'romgrk/barbar.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- >> Lualine - A statusline written in Lua.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- >> Treesitter - Better code highlighting.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }
end)
