local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local _indentations = augroup('_indentations', { clear = true })
autocmd({ 'Filetype' }, {
    pattern = {
        'html',
        'css',
        'json',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
    },
    command = 'setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2',
    group = _indentations,
})

local _markdown = augroup('_markdown', { clear = true })
autocmd({ 'Filetype' }, {
    pattern = 'markdown',
    command = 'setlocal wrap',
    group = _markdown,
})
