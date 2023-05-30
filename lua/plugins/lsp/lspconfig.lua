local M = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
        'b0o/schemastore.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
}

function M.config()
    -- setup formatting and keymaps
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            require('plugins.lsp.format').on_attach(client, buffer)
            require('plugins.lsp.keymaps').on_attach(client, buffer)
        end,
    })

    -- diagnostics
    for name, icon in pairs(require('user.settings').icons.diagnostics) do
        name = 'DiagnosticSign' .. name:gsub('^%l', string.upper) -- capitalize first letter
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
    end

    vim.diagnostic.config({
        underline = true,
        update_in_insert = true,
        virtual_text = false,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    })

    -- lspconfig
    local servers = require('user.settings').lsp.servers
    local capabilities =
        require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- for ufo-nvim
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }

    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({
        ensure_installed = servers,
        automatic_installation = true,
    })
    mason_lspconfig.setup_handlers({
        function(server)
            local opts = {}
            local has_opts, server_opts = pcall(require, 'plugins.lsp.settings.' .. server)
            if has_opts then
                opts = vim.tbl_deep_extend('force', opts, server_opts)
            end
            if server == 'rust_analyzer' then
                opts.server.capabilities = capabilities
                require('rust-tools').setup(opts)
            else
                if server == 'clangd' then
                    capabilities.offsetEncoding = { 'utf-16' }
                end
                opts.capabilities = capabilities
                require('lspconfig')[server].setup(opts)
            end
        end,
    })
end

return M
