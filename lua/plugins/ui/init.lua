return {
    require('plugins.ui.barbecue'),
    require('plugins.ui.bufferline'),
    require('plugins.ui.lualine'),
    require('plugins.ui.notify'),
    require('plugins.ui.neo-tree'),
    require('plugins.ui.theme'),

    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        event = 'VeryLazy',
        opts = {
            text = {
                spinner = 'dots',
            },
        },
    },
}
