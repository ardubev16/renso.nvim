local settings = {
    lsp = {
        servers = {
            'bashls',
            'clangd',
            -- 'ghdl_ls',
            -- 'hdl_checker',
            'html',
            'jdtls',
            'jsonls',
            'lua_ls',
            'pyright',
            'rust_analyzer',
            'taplo',
            'tsserver',
            'yamlls',
        },
    },
    null_ls = {
        formatting = {
            clang_format = {},
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
            warn = ' ',
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
