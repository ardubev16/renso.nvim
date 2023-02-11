local M = {
    'RRethy/vim-illuminate',
    event = 'BufReadPost',
}

function M.config()
    require('illuminate').configure({
        filetypes_denylist = {
            'NvimTree',
            'Telescope',
            'gitcommit',
        },
    })
end

return M
