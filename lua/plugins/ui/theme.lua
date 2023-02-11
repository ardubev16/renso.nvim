local M = {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.o.background = 'dark'
    -- For more configuration options, see:
    -- @see https://github.com/ellisonleao/gruvbox.nvim#configuration
    vim.cmd([[colorscheme gruvbox]])
end

return M
