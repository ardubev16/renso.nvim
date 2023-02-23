local package_info = {
    'vuki656/package-info.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    ft = { 'json' },
    opts = {},
}

local crates = {
    'saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = { 'toml' },
    opts = {},
}

return {
    package_info,
    crates,
}
