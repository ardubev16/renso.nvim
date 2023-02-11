return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
        local wk = require('which-key')
        wk.setup({
            plugins = {
                spelling = true,
                presets = {
                    operators = false,
                    motions = false,
                },
            },
            key_labels = { ['<leader>'] = 'SPC' },
        })
        wk.register({
            mode = { 'n', 'v' },
            ['g'] = { name = '+goto' },
            [']'] = { name = '+next' },
            ['['] = { name = '+prev' },
            ['<leader>'] = {
                -- ['b'] = { name = '+buffer' },
                ['c'] = { name = '+code' },
                ['f'] = { name = '+file' },
                ['g'] = { name = '+git' },
                ['h'] = { name = '+help' },
                ['l'] = {
                    name = '+lsp',
                    ['t'] = { name = '+trouble' },
                },
                ['n'] = { name = '+neogen' },
                -- ['o'] = { name = '+open' },
                ['r'] = { name = '+repl' },
                ['s'] = { name = '+search' },
                ['t'] = { name = '+competitest' },
                -- ['w'] = { name = '+windows' },
                -- ['<tab>'] = { name = '+tabs' },
            },
        })
    end,
}
