-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
-- local path_package = vim.fn.stdpath('data') .. '/site/'
-- local mini_path = path_package .. 'pack/deps/start/mini.nvim'
-- if not vim.loop.fs_stat(mini_path) then
--   vim.cmd('echo "Installing `mini.nvim`" | redraw')
--   local clone_cmd = {
--     'git',
--     'clone',
--     '--filter=blob:none',
--     'https://github.com/nvim-mini/mini.nvim',
--     mini_path,
--   }
--   vim.fn.system(clone_cmd)
--   vim.cmd('packadd mini.nvim | helptags ALL')
--   vim.cmd('echo "Installed `mini.nvim`" | redraw')
-- end

-- Set up 'mini.deps' (customize to your liking)
-- require('mini.deps').setup({ path = { package = path_package } })

-- local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Plugins --

-- Colorschemes
vim.pack.add({
  'https://github.com/Verf/deepwhite.nvim',
  -- add('yorickpeterse/nvim-grey')
  -- add('idr4n/github-monochrome.nvim')
  -- add('RostislavArts/naysayer.nvim')
  'https://github.com/nickkadutskyi/jb.nvim',
  -- add('HoNamDuong/hybrid.nvim')
  'https://github.com/sainnhe/sonokai',
  'https://github.com/sainnhe/everforest',
  -- add('sainnhe/gruvbox-material')
  -- add('folke/tokyonight.nvim')
  'https://github.com/uhs-robert/oasis.nvim',
  -- add({ source = 'zenbones-theme/zenbones.nvim', depends = { 'rktjmp/lush.nvim' } })
  'https://github.com/sderev/alabaster.vim',
  -- add('ronisbr/nano-theme.nvim')
  'https://github.com/wnkz/monoglow.nvim',
  -- add('xero/evangelion.nvim')
})

-- LSP
vim.pack.add({ 
  'https://github.com/neovim/nvim-lspconfig',
  { src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range('^4') },
  -- { src = 'https://github.com/mrcjkb/haskell-tools', version = vim.version.range('^4') },
})

-- Completion
vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version =  vim.version.range('v1.8.0') }
})

-- fzf-lua
vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-mini/mini.icons',
})


-- Treesitter
vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
})

-- Git
vim.pack.add({
 'https://github.com/NeogitOrg/neogit',
 'https://github.com/nvim-lua/plenary.nvim',
})
-- add('sindrets/diffview.nvim')

-- QOL/MISC
vim.pack.add({ 'https://github.com/nvim-mini/mini.hipatterns' })
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
vim.pack.add({ 'https://github.com/nvim-mini/mini.icons' })
require('mini.icons').setup()

vim.pack.add({ 
  'https://github.com/nvim-mini/mini.statusline',
  'https://github.com/chomosuke/typst-preview.nvim',
  'https://github.com/shortcuts/no-neck-pain.nvim',
})

vim.g.mapleader = ','

require('jr.fzf-lua')
require('jr.lsp')
require('jr.keymaps')
require('jr.options')
require('jr.statusline')

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

-- Clipboard
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --crlf",
    ["*"] = "win32yank.exe -o --crlf"
  },
  cache_enable = 0,
}
