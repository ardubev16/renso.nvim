local settings = {
    lsp = {
        servers = {
            'bashls',
            'clangd',
            -- 'ghdl_ls',
            -- 'hdl_checker',
            'html',
            'jsonls',
            'pyright',
            'rust_analyzer',
            'lua_ls',
            'tsserver',
            'jdtls',
        },
    },
    null_ls = {
        formatting = {
            clang_format = {
                -- FIXME: works only on save (had to also write it to ~/.clang-format)
                extra_args = { '--style={IndentWidth: 4}' },
            },
            eslint_d = {},
            tidy = {
                extra_filetypes = { 'handlebars' },
            },
            shellharden = {
                extra_filetypes = { 'zsh' },
            },
            stylua = {},
            prettier = {
                filetypes = { 'markdown' },
            },
            black = {},
            -- sqlformat = {},
            sql_formatter = {},
        },
        diagnostics = {
            cppcheck = {},
            eslint_d = {},
            tidy = {
                extra_filetypes = { 'handlebars' },
            },
            shellcheck = {
                extra_filetypes = { 'zsh' },
            },
            vale = {},
            flake8 = {},
            -- sqlfluff = { extra_args = { '--dialect', 'sqlite' } },
        },
        code_actions = {
            eslint_d = {},
            shellcheck = {
                extra_filetypes = { 'zsh' },
            },
            proselint = {},
        },
        hover = {
            -- printenv = {
            --     extra_filetypes = { 'zsh' },
            -- },
        },
    },
    icons = {
        diagnostics = {
            error = ' ',
            warn = ' ',
            hint = ' ',
            info = ' ',
        },
        git = {
            added = ' ',
            modified = '柳',
            removed = ' ',
        },
        navic = {
            Array = ' ',
            Boolean = ' ',
            Class = ' ',
            Constant = ' ',
            Constructor = ' ',
            Enum = ' ',
            EnumMember = ' ',
            Event = ' ',
            Field = ' ',
            File = ' ',
            Function = ' ',
            Interface = ' ',
            Key = ' ',
            Method = ' ',
            Module = ' ',
            Namespace = ' ',
            Null = ' ',
            Number = ' ',
            Object = ' ',
            Operator = ' ',
            Package = ' ',
            Property = ' ',
            String = ' ',
            Struct = ' ',
            TypeParameter = ' ',
            Variable = ' ',
        },
    },
}

return settings
