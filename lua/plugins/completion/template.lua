return {
    'glepnir/template.nvim',
    cmd = { 'Template', 'TemProject' },
    opts = {
        temp_dir = vim.fn.stdpath('config') .. '/templates',
    },
}
