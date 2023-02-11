return {
    'zbirenbaum/copilot.lua',
    event = 'VeryLazy', -- or 'InsertEnter'
    config = {
        suggestion = {
            auto_trigger = true,
        },
        filetypes = {
            cpp = false,
        },
    },
}
