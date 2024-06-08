_G.jr = {}

vim.g.mapleader = ","

require("jr.fzf-lua")
require("jr.lsp")
require("jr.keymaps")
require("jr.mason")
require("jr.options")
require("jr.plugins")
require("jr.statusline")
require("jr.hardtime")

vim.opt.termguicolors = true

-- Disable builtin plugins
vim.g.loaded_gzip = 1

vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
