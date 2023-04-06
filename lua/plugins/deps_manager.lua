local package_info = {
    'vuki656/package-info.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    ft = { 'json' },
    config = true,
}

local crates = {
    'saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = { 'toml' },
    config = true,
}

return {
    package_info,
    crates,
}
