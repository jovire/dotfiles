-- Native LSP Setup
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, bufopts)

        --vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.cmd.autocmd("BufWritePre <buffer> lua vim.lsp.buf.format()")
end

local lsp_flags = {
        debounce_text_changes = 200,
}

require"lspconfig".gopls.setup{
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
        settings = {
          gopls = {
            gofumpt = true,
            completeUnimported = true,
          }
        }
}

require"lspconfig".rust_analyzer.setup{
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
}
