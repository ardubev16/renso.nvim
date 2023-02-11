local M = {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
        'windwp/nvim-autopairs',
        'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
    event = 'BufReadPost',
}

function M.config()
    require('nvim-treesitter.configs').setup({
        ensure_installed = 'all', -- A list of parser names, or 'all'
        sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
        ignore_install = { '' }, -- List of parsers to ignore installing (for "all")
        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            disable = { '' },

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },

        -- Extensions
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        autopairs = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
    })
end

return M
