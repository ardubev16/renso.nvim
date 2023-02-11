return {
    'folke/trouble.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    cmd = { 'TroubleToggle', 'Trouble' },
    config = { use_diagnostic_signs = true },
    keys = {
        { '<leader>lD', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics (Trouble)' },
        { '<leader>lW', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics (Trouble)' },
    },
}
