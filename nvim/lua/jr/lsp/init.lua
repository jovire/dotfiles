-- Native LSP Setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, bufopts)
  --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, bufopts)

  vim.cmd.autocmd('BufWritePre <buffer> lua vim.lsp.buf.format()')

  -- vim.keymap.set('n', 'gr', [[<cmd>lua require('jr.telescope').lsp_references()<CR>]], bufopts)
  -- vim.keymap.set('n', 'gi', [[<cmd>lua require('jr.telescope').lsp_implementations()<CR>]], bufopts)
  vim.keymap.set('n', 'gr', [[<cmd>Fzflua lsp_references<CR>]], bufopts)
  vim.keymap.set('n', 'gi', [[<cmd>Fzflua lsp_implementations<CR>]], bufopts)
end

local lsp_flags = {
  debounce_text_changes = 200,
}

require('lspconfig').gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    gopls = {
      gofumpt = true,
      completeUnimported = true,
    },
  },
})

require('lspconfig').ocamllsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})

vim.g.rustaceanvim = function()
  return {
    server = {
      on_attach = on_attach,
    },
  }
end

require('lspconfig').lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
        },
      },
      format = {
        enable = false,
      },
      hint = {
        enable = true,
      },
    },
  },
})

require('lspconfig').zls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})
