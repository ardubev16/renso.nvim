return {
    'glepnir/template.nvim',
    cmd = { 'Template', 'TemProject' },
    opts = {
        temp_dir = require('user.util').find_config() .. '/templates',
    },
}
