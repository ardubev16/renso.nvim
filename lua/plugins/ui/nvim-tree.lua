local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    -- TODO: add lazy loading ('VeryLazy' doesn't work with auto-open)
}

function M.config()
    local tree_cb = require('nvim-tree.config').nvim_tree_callback
    local icons = require('user.settings').icons.diagnostics

    local function open_nvim_tree(data)
        -- buffer is a [No Name]
        local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not directory and not no_name then
            return
        end

        -- change to the directory
        if directory then
            vim.cmd.cd(data.file)
        end

        -- open the tree
        require('nvim-tree.api').tree.open()
    end
    vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

    require('nvim-tree').setup({
        disable_netrw = true,
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
                error = icons.error,
                warning = icons.warn,
                hint = icons.hint,
                info = icons.info,
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
    vim.keymap.set(
        'n',
        '<leader>e',
        '<cmd>NvimTreeToggle<CR>',
        { desc = 'Toggle NvimTree' }
    )
end

return M
