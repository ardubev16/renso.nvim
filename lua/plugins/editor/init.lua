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
        config = {},
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufReadPre',
        config = {},
    },
}
