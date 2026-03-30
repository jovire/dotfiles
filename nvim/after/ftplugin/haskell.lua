local ht = require('haskell-tools')
local def_opts = { noremap = true, silent = true }
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, opts)
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end, def_opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
