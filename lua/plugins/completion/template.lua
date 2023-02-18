return {
    'glepnir/template.nvim',
    cmd = { 'Template', 'TemProject' },
    config = {
        temp_dir = vim.fn.stdpath('config') .. '/templates',
    },
}
