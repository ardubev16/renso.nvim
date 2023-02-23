return {
    'jackMort/ChatGPT.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    opts = {},
    keys = {
        { '<leader>cg', '<cmd>ChatGPT<CR>', desc = 'ChatGPT' },
    },
}
