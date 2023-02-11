local M = {
    'akinsho/toggleterm.nvim',
    event = 'BufReadPost',
    keys = {
        { '<leader>gt', '<cmd>lua _LAZYGIT_TOGGLE()<cr>', desc = 'Open LazyGit' },
        { '<leader>rp', '<cmd>lua _PYTHON_TOGGLE()<cr>', desc = 'Open Python REPL' },
        { '<leader>rn', '<cmd>lua _NODE_TOGGLE()<cr>', desc = 'Open Node REPL' },
        { '<leader>rh', '<cmd>lua _HTOP_TOGGLE()<cr>', desc = 'Open htop' },
    },
}

function M.config()
    require('toggleterm').setup({
        open_mapping = [[<c-\>]],
        direction = 'float',
        on_open = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<c-\\>', '<cmd>close<cr>', { noremap = true, silent = true })
        end,
        float_opts = {
            border = 'curved',
            -- width = 100,
            -- height = 30,
            winblend = 3,
        },
    })

    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })
    function _LAZYGIT_TOGGLE()
        lazygit:toggle()
    end

    local python = Terminal:new({ cmd = 'bpython', hidden = true })
    function _PYTHON_TOGGLE()
        python:toggle()
    end

    local node = Terminal:new({ cmd = 'node', hidden = true })
    function _NODE_TOGGLE()
        node:toggle()
    end

    local htop = Terminal:new({ cmd = 'htop', hidden = true })
    function _HTOP_TOGGLE()
        htop:toggle()
    end
end

return M
