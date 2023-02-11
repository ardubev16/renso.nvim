return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    event = 'BufReadPre',
    config = function()
        local null_ls = require('null-ls')
        local config = require('user.settings').null_ls

        local sources = {}
        for feature, source_list in pairs(config) do
            for source, options in pairs(source_list) do
                local builtin = null_ls.builtins[feature][source]
                if builtin then
                    if options then
                        builtin = builtin.with(options)
                    end
                    table.insert(sources, builtin)
                end
            end
        end
        null_ls.setup({
            sources = sources,
        })
    end,
}
