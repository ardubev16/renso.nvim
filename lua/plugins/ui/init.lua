return {
    require('plugins.ui.barbecue'),
    require('plugins.ui.bufferline'),
    require('plugins.ui.lualine'),
    require('plugins.ui.notify'),
    require('plugins.ui.nvim-tree'),
    require('plugins.ui.theme'),

    {
        'j-hui/fidget.nvim',
        event = 'VeryLazy',
        config = true,
    },
}
