vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.cmd([["setlocal expandtab"]])

vim.keymap.set('n', 'K', function()
  vim.cmd.RustLsp { 'hover', 'actions' }
end)
vim.keymap.set('n', '<leader>re', function()
    vim.cmd.RustLsp('explainError')
end)
