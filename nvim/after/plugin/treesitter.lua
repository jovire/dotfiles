if not pcall(require, "nvim-treesitter") then
        return
end

local _ = require("nvim-treesitter.configs").setup {
        ensure_installed = {
                "dockerfile",
                "go",
                "html",
                "json",
                "markdown",
                "python",
                "query",
                "rust",
                "vim",
        },

        highlight = {
                enable = true,
                use_languagetree = false,
                custom_captures = {
                        ["function.call"] = "LuaFunctionCall",
                        ["function.bracket"] = "Type",
                        ["namespace.type"] = "TSNamespaceType",
                },
        },
        indent = {
                enable = false
        },
}
