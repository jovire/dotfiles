_G.jr = {}

vim.g.mapleader = ","

require("jr.lsp")
require("jr.mappings")
require("jr.mason")
require("jr.options")
require("jr.plugins")
require("jr.telescope.setup")
require("jr.telescope.mappings")
require("jr.statusline")

vim.opt.termguicolors = true
