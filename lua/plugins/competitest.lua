local M = {
    'xeluxee/competitest.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    ft = { 'cpp' },
}

M.keys = {
    { '<leader>ta', '<cmd>CompetiTestAdd<CR>', desc = 'Add test' },
    { '<leader>te', '<cmd>CompetiTestEdit<CR>', desc = 'Edit test' },
    { '<leader>tc', '<cmd>CompetiTestReceive<CR>', desc = 'Start companion' },
    { '<leader>tr', '<cmd>CompetiTestRun<CR>', desc = 'Run tests' },
}

M.opts = {
    floating_border = 'single',
    floating_border_highlight = 'FloatBorder',
    editor_ui = {
        popup_width = 0.4,
        popup_height = 0.6,
        show_nu = true,
        show_rnu = false,
        normal_mode_mappings = {
            switch_window = { '<C-h>', '<C-l>', '<C-i>' },
            save_and_close = 'w',
            cancel = { 'q', 'Q' },
        },
        insert_mode_mappings = {
            switch_window = { '<C-h>', '<C-l>', '<C-i>' },
            -- save_and_close = '<C-s>',
            cancel = '<C-q>',
        },
    },

    compile_directory = '.',
    compile_command = {
        c = { exec = 'gcc', args = { '-Wall', '-DLOCAL', '$(FNAME)', '-o', '$(FNOEXT)' } },
        cpp = { exec = 'g++', args = { '-Wall', '-DLOCAL', '$(FNAME)', '-o', '$(FNOEXT)' } },
        rust = { exec = 'rustc', args = { '--cfg', 'local', '$(FNAME)' } },
        java = { exec = 'javac', args = { '$(FNAME)' } },
    },
    running_directory = '.',
    run_command = {
        c = { exec = './$(FNOEXT)' },
        cpp = { exec = './$(FNOEXT)' },
        rust = { exec = './$(FNOEXT)' },
        python = { exec = 'python', args = { '$(FNAME)' } },
        java = { exec = 'java', args = { '$(FNOEXT)' } },
    },
    multiple_testing = -1,
    maximum_time = 5000,
    output_compare_method = 'squish',
    view_output_diff = true,

    testcases_directory = './tests',
    testcases_use_single_file = false,
    testcases_auto_detect_storage = true,
    testcases_single_file_format = '$(FNOEXT).testcases',
    testcases_input_file_format = '$(FNOEXT)_input-$(TCNUM).txt',
    testcases_output_file_format = '$(FNOEXT)_output-$(TCNUM).txt',
}

return M
