return {
    'zbirenbaum/copilot.lua',
    event = 'VeryLazy', -- or 'InsertEnter'
    opts = {
        suggestion = {
            auto_trigger = true,
        },
        filetypes = {
            cpp = false,
        },
    },
}
