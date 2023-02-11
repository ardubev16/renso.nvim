local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local Mode = {
    NORMAL = 'n',
    INSERT = 'i',
    VISUAL = 'v',
    VISUAL_BLOCK = 'x',
    TERM = 't',
    COMMAND = 'c',
}

-- Y behave like C D
keymap(Mode.NORMAL, 'Y', 'y$', opts)

-- Keep centered with n N J
keymap(Mode.NORMAL, 'n', 'nzzzv', opts)
keymap(Mode.NORMAL, 'N', 'Nzzzv', opts)
keymap(Mode.NORMAL, 'J', 'mzJ`z', opts)

-- Undo break points with , . ! ?
keymap(Mode.INSERT, ',', ',<C-g>u', opts)
keymap(Mode.INSERT, '.', '.<C-g>u', opts)
keymap(Mode.INSERT, '!', '!<C-g>u', opts)
keymap(Mode.INSERT, '?', '?<C-g>u', opts)

-- Stay in indent mode
keymap(Mode.VISUAL, '<', '<gv', opts)
keymap(Mode.VISUAL, '>', '>gv', opts)

-- Better window navigation
keymap(Mode.NORMAL, '<C-h>', '<C-w>h', opts)
keymap(Mode.NORMAL, '<C-j>', '<C-w>j', opts)
keymap(Mode.NORMAL, '<C-k>', '<C-w>k', opts)
keymap(Mode.NORMAL, '<C-l>', '<C-w>l', opts)

-- Move lines
keymap(Mode.NORMAL, '<M-j>', '<cmd>m .+1<CR>==', opts)
keymap(Mode.NORMAL, '<M-k>', '<cmd>m .-2<CR>==', opts)
keymap(Mode.VISUAL, '<M-j>', "<cmd>m '>+1<CR>gv=gv", opts)
keymap(Mode.VISUAL, '<M-k>', "<cmd>m '<-2<CR>gv=gv", opts)

-- Yank to clipboard
keymap(Mode.NORMAL, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
keymap(Mode.VISUAL, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
keymap(Mode.NORMAL, '<leader>Y', 'gg"+yG', { desc = 'Yank file to clipboard' })

-- Deletes to the black hole register
keymap(Mode.VISUAL_BLOCK, '<leader>p', '"_dP', { desc = 'Paste without yanking' })
keymap(Mode.NORMAL, '<leader>d', '"_d', { desc = 'Delete to black hole' })
keymap(Mode.VISUAL, '<leader>d', '"_d', { desc = 'Delete to black hole' })
