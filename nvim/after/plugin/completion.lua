vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require'cmp'

cmp.setup({
        snippet = {
                expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                end,
        },
        window = {},
        mapping = {
                ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-y>'] = cmp.mapping(
                cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true
                },
                {"i", "c"})
        },
        sources = cmp.config.sources({
                { name = 'nvim_lua' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer', keyword_length = 5 },
        }),

        formatting = {
                format = function(entry, vim_item)
                        vim_item.menu = ({
                                rg = '[Rg]',
                                buffer = '[buf]',
                                nvim_lsp = '[LSP]',
                                nvim_lua = '[api]',
                                path = '[path]',
                                luasnip = '[snip]',
                        })[entry.source.name]
                        return vim_item
                end,
        },
        experimental = {
                native_menu = false,
        },
})
