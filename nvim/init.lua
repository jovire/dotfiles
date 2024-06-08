-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Plugins --

-- Colorschemes
add('HoNamDuong/hybrid.nvim')
add('Verf/deepwhite.nvim')
add('marko-cerovac/material.nvim')
add('rebelot/kanagawa.nvim')

-- LSP
add('neovim/nvim-lspconfig')
add('williamboman/mason-lspconfig.nvim')
add('williamboman/mason.nvim')

add({ source = 'mrcjkb/haskell-tools.nvim', checkout = '1.x.x' })
add({ source = 'mrcjkb/rustaceanvim', version = '^4' })

-- Completion
add('L3MON4D3/LuaSnip')
add('hrsh7th/cmp-buffer')
add('hrsh7th/cmp-nvim-lsp')
add('hrsh7th/cmp-nvim-lua')
add('hrsh7th/cmp-path')
add('hrsh7th/nvim-cmp')
add('saadparwaiz1/cmp_luasnip')

-- fzf-lua
add({ source = 'ibhagwan/fzf-lua', depends = { 'nvim-tree/nvim-web-devicons' } })

-- Treesitter
add('nvim-treesitter/nvim-treesitter')

-- QOL/MISC
add('NvChad/nvim-colorizer.lua')
require('colorizer').setup()

add('j-hui/fidget.nvim')
add({ source = 'm4xshen/hardtime.nvim', depends = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' } })
add({ source = 'nvim-lualine/lualine.nvim', depends = { 'nvim-tree/nvim-web-devicons' } })

vim.g.mapleader = ','

require('jr.fzf-lua')
require('jr.lsp')
require('jr.keymaps')
require('jr.mason')
require('jr.options')
require('jr.statusline')
require('jr.hardtime')

now(function() vim.opt.termguicolors = true end)

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
