local util = require('user.util')

local M = {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    cmd = 'Telescope',
}

M.keys = {
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<leader>ff', util.telescope('find_files'), desc = 'Find Files (root dir)' },
    { '<leader>fF', util.telescope('find_files', { cwd = false }), desc = 'Find Files (cwd)' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
    { '<leader>ft', '<cmd>Telescope find_template type=insert<cr>', desc = 'Find template' },
    { '<leader>fT', '<cmd>Telescope find_template<cr>', desc = 'Find all templates' },
    { '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = 'commits' },
    { '<leader>gs', '<cmd>Telescope git_status<cr>', desc = 'status' },
    { '<leader>ha', '<cmd>Telescope autocommands<cr>', desc = 'Auto Commands' },
    { '<leader>hc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
    { '<leader>hf', '<cmd>Telescope filetypes<cr>', desc = 'File Types' },
    { '<leader>hh', '<cmd>Telescope help_tags<cr>', desc = 'Help Pages' },
    { '<leader>hk', '<cmd>Telescope keymaps<cr>', desc = 'Key Maps' },
    { '<leader>hm', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
    { '<leader>ho', '<cmd>Telescope vim_options<cr>', desc = 'Options' },
    { '<leader>hs', '<cmd>Telescope highlights<cr>', desc = 'Search Highlight Groups' },
    { '<leader>ht', '<cmd>Telescope builtin<cr>', desc = 'Telescope' },
    { '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Buffer' },
    { '<leader>sc', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
    { '<leader>sf', util.telescope('live_grep'), desc = 'Search Files (root dir)' },
    { '<leader>sF', util.telescope('live_grep', { cwd = false }), desc = 'Search Files (cwd)' },
    { '<leader>sm', '<cmd>Telescope marks<cr>', desc = 'Jump to Mark' },
    { '<leader>,', '<cmd>Telescope buffers show_all_buffers=true<cr>', desc = 'Switch Buffer' },
    {
        '<leader>ss',
        util.telescope('lsp_document_symbols', {
            symbols = {
                'Class',
                'Function',
                'Method',
                'Constructor',
                'Interface',
                'Module',
                'Struct',
                'Trait',
                'Field',
                'Property',
            },
        }),
        desc = 'Goto Symbol',
    },
}

function M.config()
    local telescope = require('telescope')

    telescope.setup({
        defaults = {
            prompt_prefix = ' ',
            selection_caret = ' ',
            -- path_display = { 'smart' },
            mappings = {
                i = {
                    ['<c-t>'] = function(...)
                        return require('trouble.providers.telescope').open_with_trouble(...)
                    end,
                    ['<C-i>'] = function()
                        util.telescope('find_files', { no_ignore = true })()
                    end,
                    ['<C-h>'] = function()
                        util.telescope('find_files', { hidden = true })()
                    end,
                    ['<C-Down>'] = function(...)
                        return require('telescope.actions').cycle_history_next(...)
                    end,
                    ['<C-Up>'] = function(...)
                        return require('telescope.actions').cycle_history_prev(...)
                    end,
                },
            },
        },
        extensions = {
            -- TODO: add more extensions (e.g. tmux integration, cheatsheet, vimspector, ecc.)
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            },
        },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('find_template')
end

return M
