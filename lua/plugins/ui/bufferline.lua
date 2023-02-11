local M = {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = 'BufAdd',
}

function M.config()
    require('bufferline').setup({
        options = {
            show_buffer_close_icons = false,
            show_close_icon = false,
            always_show_bufferline = false,
            diagnostics = 'nvim_lsp',
            -- diagnostics_update_in_insert = false,
            diagnostics_indicator = function(_, _, diag)
                local icons = require('user.settings').icons.diagnostics
                local ret = (diag.error and icons.error .. diag.error)
                    or (diag.warning and icons.warn .. diag.warning)
                    or ''
                return vim.trim(ret)
            end,
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    highlight = 'Directory',
                    text_align = 'center',
                },
            },
        },
    })
end

function M.init()
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', opts)
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', opts)
    vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Exit buffer' })
end

return M
