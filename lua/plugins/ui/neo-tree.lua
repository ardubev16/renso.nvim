local M = {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    -- TODO: add lazy loading ('VeryLazy' doesn't work with auto-open)
}

function M.config()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    local diagnostics = require('user.settings').icons.diagnostics
    local diagnostics_icons = {
        DiagnosticSignError = diagnostics.error,
        DiagnosticSignWarn = diagnostics.warn,
        DiagnosticSignInfo = diagnostics.info,
        DiagnosticSignHint = diagnostics.hint,
    }
    for diagnostic, icon in pairs(diagnostics_icons) do
        vim.fn.sign_define(diagnostic, { text = icon, texthl = diagnostic })
    end

    require('neo-tree').setup({
        default_component_configs = {
            icon = {
                folder_closed = '',
                folder_open = '',
                folder_empty = '',
            },
            git_status = {
                symbols = {
                    -- Change type
                    added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted = '✖', -- this can only be used in the git_status source
                    renamed = '', -- this can only be used in the git_status source
                    -- Status type
                    untracked = '',
                    ignored = '',
                    unstaged = '',
                    staged = '',
                    conflict = '',
                },
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_hidden = false,
                never_show = {
                    'node_modules',
                    '.git',
                    '.cache',
                    '.DS_Store',
                },
            },
        },
        event_handlers = {
            {
                event = 'file_opened',
                handler = function()
                    require('neo-tree.command').execute({ action = 'close' })
                end,
            },
        },
        window = {
            mappings = {
                ['<space>'] = 'none',
                ['h'] = function(state)
                    local node = state.tree:get_node()
                    if node.type == 'directory' and node:is_expanded() then
                        require('neo-tree.sources.filesystem').toggle_directory(state, node)
                    else
                        require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                    end
                end,
                ['l'] = 'open',
                ['u'] = 'navigate_up',
            },
        },
    })
end

function M.init()
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree focus toggle<CR>', { desc = 'Toggle NeoTree' })
end

return M
