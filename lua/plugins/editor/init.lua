return {
    require('plugins.editor.telescope'),
    require('plugins.editor.gitsigns'),
    require('plugins.editor.trouble'),
    require('plugins.editor.which-key'),
    require('plugins.editor.nvim-tree'),
    require('plugins.editor.toggleterm'),

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
