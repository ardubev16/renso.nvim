local M = {
    'andrewferrier/debugprint.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
}

M.config = {
    create_keymaps = false,
    create_commands = false,
}

M.keys = {
    {
        '<leader>cp',
        function()
            return require('debugprint').debugprint()
        end,
        expr = true,
        desc = 'Dbg print',
    },
    {
        '<leader>cP',
        function()
            return require('debugprint').debugprint({ above = true })
        end,
        expr = true,
        desc = 'Dbg print above',
    },
    {
        '<leader>cv',
        function()
            return require('debugprint').debugprint({ variable = true })
        end,
        expr = true,
        desc = 'Dbg print var',
    },
    {
        '<leader>cV',
        function()
            return require('debugprint').debugprint({ variable = true, above = true })
        end,
        expr = true,
        desc = 'Dbg print var above',
    },
    {
        '<leader>cd',
        function()
            return require('debugprint').deleteprints()
        end,
        desc = 'Delete dbg prints',
    },
}

return M
