local M = {
    'numToStr/Comment.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    -- TODO: check lazy loading
    event = 'BufReadPost',
}

function M.config()
    require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })

    local ft = require('Comment.ft')
    ft.vhdl = '-- %s'
end

return M
