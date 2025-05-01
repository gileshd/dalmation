-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use 'drewtempelmeyer/palenight.vim'

    -- Tim Pope the Vim Pope --
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-repeat'
    use 'tpope/vim-markdown'

    -- LSP --
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- Git(Hub) --
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
    }

    use 'github/copilot.vim'
    use 'madox2/vim-ai'

    -- Python --
    use {
         'psf/black',
    	 branch= 'stable'
    }

    -- Misc --
    use 'wuelnerdotexe/nerdterm'
    use 'folke/zen-mode.nvim'
    use 'itchyny/lightline.vim'
    use 'liuchengxu/vim-which-key'

    -- use 'preservim/vim-markdown'
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",

        },
        -- config = function()
        --     require("obsidian").setup({
        --         workspaces = {
        --             {
        --                 name = "work",
        --                 path = "~/Documents/Obsidian_Vault/"
        --             },
        --         },

        --     })
        -- end,
    })

end)

