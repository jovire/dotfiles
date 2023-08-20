local M = {}

function M.kanagawa()
  vim.o.background = "dark"
  require("kanagawa").setup({
      dimInactive = false,
      background = { light = "lotus", dark = "wave" },
      -- colors = {
      --   palette = {
      --     oldWhite = "#9DA2AF",
      --     fujiWhite = "#9DA2AF",
      --     fujiGray = "#33373A",
      --     sumiInk3 = "#17191C"
      --   },
      -- },
      overrides = function(colors)
        local theme = colors.theme
        return {
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
      }
    end,
  })
  vim.cmd.colorscheme("kanagawa")
end

function M.gruvbox(theme)
  vim.o.background = theme,
  require("gruvbox").setup({
    contrast = "hard",
  })
  vim.cmd.colorscheme("gruvbox")
end

function M.catppuccin()
  vim.o.background = "dark"
  require("catppuccin").setup({
    flavour = "mocha",
    term_colors = true,
    color_overrides = {
      latte = {
        text = "#000000",
        base = "#E1EEF5",
      },
      mocha = {
        text = "#FFFFFF",
        base = "#000000",
      },
    },
    highlight_overrides = {
      latte = function(_)
        return {
          NvimTreeNormal = { bg = "#D1E5F0" },
        }
      end,
      mocha = function(mocha)
        return {
          TabLineSel = { bg = mocha.pink },
          NvimTreeNormal = { bg = mocha.none },
          CmpBorder = { fg = mocha.surface2 },
          GitSignsCHange = { fg = mocha.blue },
        }
      end,
    },
  })
  vim.cmd.colorscheme("catppuccin")
end

function M.material()
  vim.g.material_style = 'darker'
vim.g.material_terminal_italics = 1

require('material').setup {
  contrast = {
    terminal = true,
    floating_windows = false,
    cursor_line = true,
    non_current_windows = true,
  },
  styles = {
    comments = { italic = true },
  },
  plugins = {
    'gitsigns',
    'nvim-cmp',
    'nvim-navic',
    'nvim-tree',
    'telescope',
  },
  disable = {
    colored_cursor = true,
  },
  high_visibility = {
    lighter = true,
    darker = true,
  },
  async_loading = true,
  custom_highlights = {
    LspCodeLens = { link = 'DiagnosticHint', italic = true },
    TermCursor = { link = 'Cursor' },
    TermCursorNC = { bg = '#FF5370', fg = 'white', ctermbg = 1, ctermfg = 15 },
    FidgetTitle = { link = 'DiagnosticHint' },
    IlluminatedWordRead = { link = 'TSDefinitionUsage' },
    IlluminatedWordWrite = { link = 'TSDefinitionUsage' },
    IlluminatedWordText = { link = 'TSDefinitionUsage' },
  },
  custom_colors = function(colors)
    colors.editor.fg = '#FFFFFF'
    colors.editor.fg_dark = colors.main.white
    colors.editor.accent = colors.main.darkpurple
  end,
}
vim.cmd.colorscheme('material')
end

function M.rosepine()
  require("rose-pine").setup({
    variant = "main",
    disable_italics = true,
    groups = {
      background = "#000000"
    },
    highlight_groups = {
      TelescopeBorder = { bg = "#000000" },
      TelescopeNormal = { bg = "#000000" },
      TelescopePromptNormal = { bg = "#000000" },
      TelescopeResultsNormal = { bg = "#000000" },
    },
  })
  vim.cmd.colorscheme("rose-pine")
end


-- M.material()
-- M.catppuccin()
M.kanagawa()
-- vim.o.background = "light"
-- vim.cmd.colorscheme("plain")
return M
