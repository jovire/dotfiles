local M = {}

function M.deepwhite()
  -- If you have some anti-blue light setting (f.lux, light bulb, or low blue light mode monitor),
  -- turn it on, this will set the background color to a cooler color to prevent the background from being too warm.
  require('deepwhite').setup({
    low_blue_light = true
  })
  vim.cmd.colorscheme('deepwhite')
  -- Match Flatwhite better via Helix colors
  -- vim.api.nvim_set_hl(0, 'Normal', { fg = '#605a52', bg = '#f7f3ee' })
  -- vim.api.nvim_set_hl(0, 'Normal', { fg = '#000000', bg = '#FEF0DF' })
end

function M.quiet()
  vim.cmd.colorscheme('quiet')
  -- vim.api.nvim_set_hl(0, 'Keyword', { bold = true })
  -- vim.api.nvim_set_hl(0, 'Normal', { fg = '#000000', bg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'Comment', { bold = true, italic = true })
  -- vim.api.nvim_set_hl(0, 'Comment', { fg = '#707070', italic = true })
  vim.api.nvim_set_hl(0, 'Constant', { fg = '#999999' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#333333' })
  -- vim.api.nvim_set_hl(0, 'Keyword', { bold = true, fg = "#e0def4" })
  -- vim.api.nvim_set_hl(0, 'Comment', { fg = '#eb6f92', italic = true })
  -- vim.api.nvim_set_hl(0, 'Constant', { fg = '#908caa' })
end

function M.minimum()
  vim.cmd.colorscheme("minimum")
  -- vim.api.nvim_set_hl(0, 'Normal', { fg = '#000000', bg = '#fff2cc' }) --matttproud.com
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7f7f7f' }) --yui
  vim.api.nvim_set_hl(0, 'Normal', { fg = '#000000', bg = '#ededed' })
  -- vim.api.nvim_set_hl(0, 'Normal', { fg = '#666b61', bg = '#ebebea' })
  -- vim.api.nvim_set_hl(0, 'Normal', { fg = '#3D3C44', bg = '#F1EDED' }) --yui
  -- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#000000', bg = '#d4c3b4' })      --yui
  -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#737373', bg = '#d4c3b4' }) --yui
end

function M.oasis()
  require('oasis').setup({
    style = "cactus",
    light_intensity = 3,
  })
  vim.cmd.colorscheme('oasis')
end


-- vim.opt.termguicolors = false
-- vim.o.background = 'dark'
-- vim.cmd.colorscheme('sonokai')
-- vim.o.background = 'light'
-- vim.cmd("let g:yui_comments = 'fade'")

-- vim.cmd("let g:everforest_background = 'hard'")
-- vim.cmd.colorscheme('everforest')
-- vim.api.nvim_set_hl(0, 'Normal', { fg = '#000000', bg = '#eaeade' })
-- vim.api.nvim_set_hl(0, 'Normal', { fg = '#cecece', bg = '#23272c' })
-- vim.api.nvim_set_hl(0, 'Normal', { fg = '#29242A', bg = '#FEFAF9' })
-- vim.api.nvim_set_hl(0, 'Normal', { fg = '#dddddd', bg = '#102040' }) -- Aaardvark Blue


M.oasis()

return M
