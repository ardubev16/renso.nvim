return {
    require('plugins.lsp.null-ls'),
    require('plugins.lsp.lspconfig'),

    {
        'simrat39/rust-tools.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            -- 'nvim-lua/plenary.nvim',
            -- 'mfussenegger/nvim-dap',
        },
        ft = { 'rust' },
        -- config = {},
    },

    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
        opts = {},
    },
    {
        'jay-babu/mason-null-ls.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'jose-elias-alvarez/null-ls.nvim',
        },
        event = 'VeryLazy',
        opts = {
            automatic_installation = true,
        },
    },
}
