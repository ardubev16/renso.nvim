local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    -- TODO: add lazy loading ('VeryLazy' doesn't work the way I use it)
}

function M.config()
    -- Replaces auto_close
    local tree_cb = require('nvim-tree.config').nvim_tree_callback
    vim.api.nvim_create_autocmd('BufEnter', {
        nested = true,
        callback = function()
            if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
                vim.cmd('quit')
            end
        end,
    })

    require('nvim-tree').setup({
        disable_netrw = true,
        open_on_setup = true,
        ignore_ft_on_setup = {
            'startify',
            'dashboard',
            'alpha',
        },
        view = {
            mappings = {
                custom_only = false,
                list = {
                    { key = { 'l', '<CR>', 'o' }, cb = tree_cb('edit') },
                    { key = 'h', cb = tree_cb('close_node') },
                    { key = 'v', cb = tree_cb('vsplit') },
                },
            },
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
        },
        diagnostics = {
            enable = true,
            icons = {
                error = '',
                warning = '',
                hint = '',
                info = '',
            },
        },
        renderer = {
            icons = {
                git_placement = 'signcolumn',
                show = {
                    folder_arrow = false,
                },
                glyphs = {
                    folder = {
                        default = '',
                        open = '',
                    },
                },
            },
        },
    })
end

function M.init()
    vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
end

return M
