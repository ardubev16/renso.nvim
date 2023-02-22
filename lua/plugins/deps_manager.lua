local package_info = {
    'vuki656/package-info.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    ft = { 'json' },
    config = {},
}

local crates = {
    'saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = { 'toml' },
    config = {},
}

return {
    package_info,
    crates,
}
