return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = {
        signs = {
            add = { text = '▎' },
            change = { text = '▎' },
            delete = { text = '契' },
            topdelete = { text = '契' },
            changedelete = { text = '▎' },
            untracked = { text = '▎' },
        },

        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = buffer
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', '<leader>gj', function()
                if vim.wo.diff then
                    return '<leader>gj'
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, desc = 'Goto next hunk' })

            map('n', '<leader>gk', function()
                if vim.wo.diff then
                    return '<leader>gk'
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, desc = 'Goto previous hunk' })

            -- Actions
            map('n', '<leader>gb', gs.blame_line, { desc = 'Show blame' })
            map('n', '<leader>gp', gs.preview_hunk, { desc = 'Show hunk preview' })
            map('n', '<leader>ga', gs.stage_hunk, { desc = 'Add hunk' })
            map('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
            map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
            map('n', '<leader>gA', gs.stage_buffer, { desc = 'Add buffer' })
            map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
            map('n', '<leader>gd', gs.diffthis, { desc = 'Show side-by-side diff' })
            map('n', '<leader>gD', gs.toggle_deleted, { desc = 'Toggle show deleted' })

            -- Text object
            map({ 'o', 'x' }, 'gh', '<cmd><C-U>Gitsigns select_hunk<CR>')
        end,
    },
}
