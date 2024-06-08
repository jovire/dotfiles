local M = {}

local keymap = vim.keymap

-- Buffer list navigation
keymap.set('n', '[b', vim.cmd.bprevious, { silent = true })
keymap.set('n', ']b', vim.cmd.bnext, { silent = true })
keymap.set('n', '[B', vim.cmd.bfirst, { silent = true })
keymap.set('n', ']B', vim.cmd.blast, { silent = true })

-- Center screen
keymap.set('n', '<space>', 'zz', { noremap = true })

-- Search mappings
keymap.set('n', 'n', 'nzzzv', { noremap = true })
keymap.set('n', 'N', 'Nzzzv', { noremap = true })

-- Center when going up/down
keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
keymap.set('n', '<C-f>', '<C-f>zz', { noremap = true })
keymap.set('n', '<C-b>', '<C-b>zz', { noremap = true })

-- Move sanely through wrapped lines
keymap.set('n', 'j', 'gj', { noremap = true })
keymap.set('n', 'k', 'gk', { noremap = true })

-- Get rid of q: window
keymap.set('', 'q:', ':q')

-- Pane navigation
keymap.set('n', '<C-h>', '<C-W><C-h>')
keymap.set('n', '<C-j>', '<C-W><C-j>')
keymap.set('n', '<C-k>', '<C-W><C-k>')
keymap.set('n', '<C-l>', '<C-W><C-l>')

-- Terminal pane navigation
keymap.set('n', '<C-h>', '<C-\\><C-N><C-w>h')
keymap.set('n', '<C-j>', '<C-\\><C-N><C-w>j')
keymap.set('n', '<C-k>', '<C-\\><C-N><C-w>k')
keymap.set('n', '<C-l>', '<C-\\><C-N><C-w>l')

return M
