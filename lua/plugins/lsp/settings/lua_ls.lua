return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [require('user.util').find_config() .. '/lua'] = true,
                },
            },
        },
    },
}
