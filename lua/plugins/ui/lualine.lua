local M = {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
}

function M.config()
    local symbols = require('user.settings').icons

    local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = symbols.diagnostic,
    }

    local diff = {
        'diff',
        symbols = symbols.git,
        cond = function()
            return vim.fn.winwidth(0) > 80
        end,
    }

    require('lualine').setup({
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
            always_divide_middle = true,
            globalstatus = false,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', diff },
            lualine_c = { diagnostics },
            lualine_x = {
                'fileformat',
                'encoding',
                { 'filetype', colored = false },
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = { 'nvim-tree' },
    })
end

return M
