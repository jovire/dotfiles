local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  {
    workspace = {
      didChangeWatchedFiles = {
	dynamicRegistration = true
      }
    },
  }
)

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup, --not sure what this does
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, bufopts)

    vim.cmd.autocmd('BufWritePre <buffer> lua vim.lsp.buf.format()')
    vim.keymap.set('n', 'gr', [[<cmd>FzfLua lsp_references<CR>]], bufopts)
    vim.keymap.set('n', 'gi', [[<cmd>FzfLua lsp_implementations<CR>]], bufopts)
    vim.keymap.set('n', '<leader>K', [[<cmd>split <bar> FzfLua lsp_definitions<CR>]], bufopts)
  end
})

-- vim.lsp.config('basedpyright', {
--   capabilities = capabilities,
--   cmd = { 'basedpyright-langserver', '--stdio' },
-- })

vim.g.rustaceanvim = function()
  return {
    server = {
      -- on_attach = on_attach,
      default_settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          inlayHints = {
            lifetimeElisonHints = {
              enable = true,
              useParameterNames = true,
            },
          },
        },
      },
    },
  }
end

vim.lsp.enable('ty')
