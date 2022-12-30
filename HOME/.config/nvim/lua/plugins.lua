-- Before plugins are loaded
vim.g['ale_disable_lsp'] = 1

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself.

    use 'airblade/vim-gitgutter'
    use 'dense-analysis/ale' -- Linting
    use 'editorconfig/editorconfig-vim' -- Support for .editorconfig files.
    use 'fladson/vim-kitty' -- Support for kitty.conf.
    use 'honza/vim-snippets' -- Some snippets.
    use 'mhinz/vim-startify' -- Start screen.
    use 'sainnhe/everforest' -- Everforest colorscheme.
    use 'preservim/nerdcommenter' -- Automatic text commenter.
    use 'scrooloose/nerdtree' -- Tree file management.
    use 'tmsvg/pear-tree' -- Pair quotes, parentheses, HTML tags, etc.
    use 'tpope/vim-fugitive' -- Good git support.
    use 'tpope/vim-sleuth' -- Indentation management.
    use {'mg979/vim-visual-multi', branch = 'master'}
    use {'neoclide/coc.nvim', branch = 'release'} -- VSCode-like code completion.

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'romgrk/barbar.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
end)
