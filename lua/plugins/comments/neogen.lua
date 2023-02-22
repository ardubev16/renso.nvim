local M = {
    'danymat/neogen',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'L3MON4D3/LuaSnip',
    },
    config = {
        enabled = true,
        snippet_engine = 'luasnip',
    },
}

M.keys = {
    {
        '<leader>nf',
        '<cmd>lua require("neogen").generate({ type = "func" })<CR>',
        desc = 'Generate function docs',
    },
    {
        '<leader>nc',
        '<cmd>lua require("neogen").generate({ type = "class" })<CR>',
        desc = 'Generate class docs',
    },
    {
        '<leader>nt',
        '<cmd>lua require("neogen").generate({ type = "type" })<CR>',
        desc = 'Generate type docs',
    },
}

return M
