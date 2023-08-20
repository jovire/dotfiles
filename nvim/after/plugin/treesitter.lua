if not pcall(require, "nvim-treesitter") then
        return
end

local _ = require("nvim-treesitter.configs").setup {
        ensure_installed = {
                "go",
                "haskell",
                "html",
                "json",
                "lua",
                "markdown",
                "ocaml",
                "python",
                "query",
                "rust",
                "vim",
                "vimdoc",
        },

        highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                use_languagetree = false,
        },
        indent = {
                enable = false
        },
}
