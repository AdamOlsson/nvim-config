-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'rose-pine/neovim', as = 'rose-pine' }
    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
    use { 'nvim-treesitter/playground' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }

    use 'neovim/nvim-lspconfig'
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })

    use 'hrsh7th/nvim-cmp'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    use { "akinsho/toggleterm.nvim", tag = '*' }

    use { "sakhnik/nvim-gdb" }
end)
