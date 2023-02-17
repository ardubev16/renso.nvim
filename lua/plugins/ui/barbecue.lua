return {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
        'SmiteshP/nvim-navic',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        kinds = require('user.settings').icons.navic,
        show_modified = true,
        show_dirname = false,
    },
}
