return {
    require('plugins.editor.gitsigns'),
    require('plugins.editor.illuminate'),
    require('plugins.editor.telescope'),
    require('plugins.editor.toggleterm'),
    require('plugins.editor.trouble'),
    require('plugins.editor.which-key'),

    {
        'norcalli/nvim-colorizer.lua',
        event = 'BufReadPre',
        opts = {},
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufReadPre',
        opts = {},
    },
}
