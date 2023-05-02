local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    -- TODO: add lazy loading ('VeryLazy' doesn't work with auto-open)
}

function M.config()
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

    local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
            return {
                desc = 'nvim-tree: ' .. desc,
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = true,
            }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    end

    require('nvim-tree').setup({
        disable_netrw = true,
        on_attach = on_attach,
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
    vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
end

return M
