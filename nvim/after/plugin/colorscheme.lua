local M = {}

function M.kanagawa()
  vim.o.background = "dark"
  require("kanagawa").setup({
      dimInactive = false,
      background = { light = "lotus", dark = "dragon" },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Normal = { bg = "#000000" },
          LineNr = { bg = theme.ui.bg },
          SignColumn = { bg = theme.ui.bg },
          FzfPreviewTitle = { bg = '#ABCF76' },
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          NormalFloat = { bg = "none" },
          FloatTitle = { bg = "none" },
          FloatBorder = { bg = "none" },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LspInlayHint = { fg = theme.ui.special },
          ["@string.regexp"] = { link = "@string.regex" },
          ["@variable.parameter"] = { link = "@parameter" },
          ["@exception"] = { link = "@exception" },
          ["@string.special.symbol"] = { link = "@symbol" },
          ["@markup.strong"] = { link = "@text.strong" },
          ["@markup.italic"] = { link = "@text.emphasis" },
          ["@markup.heading"] = { link = "@text.title" },
          ["@markup.raw"] = { link = "@text.literal" },
          ["@markup.quote"] = { link = "@text.quote" },
          ["@markup.math"] = { link = "@text.math" },
          ["@markup.environment"] = { link = "@text.environment" },
          ["@markup.environment.name"] = { link = "@text.environment.name" },
          ["@markup.link.url"] = { link = "Special" },
          ["@markup.link.label"] = { link = "Identifier" },
          ["@comment.note"] = { link = "@text.note" },
          ["@comment.warning"] = { link = "@text.warning" },
          ["@comment.todo"] = { link = "@text.todo" },
          ["@comment.danger"] = { link = "@text.danger" },
          ["@diff.plus"] = { link = "@text.diff.add" },
          ["@diff.minus"] = { link = "@text.diff.delete" },
      }
    end,
  })
  vim.cmd.colorscheme("kanagawa")
end

function M.catppuccin()
  vim.o.background = "dark"
  require("catppuccin").setup({
    flavour = "mocha",
    term_colors = true,
    no_italic = true,
    color_overrides = {
      latte = {
        text = "#000000",
        base = "#E1EEF5",
      },
      mocha = {
        text = "#FFFFFF",
        base = "#000000",
        -- base = "#11111B",
        mantle = "#11111B",
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
      'fidget',
      'gitsigns',
      'mini',
      'nvim-cmp',
      'nvim-navic',
      'nvim-tree',
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
      LspCodeLens = { link = '#B480D6', italic = true },
      TermCursor = { link = 'Cursor' },
      TermCursorNC = { bg = '#FF5370', fg = '#EEEEEE', ctermbg = 1, ctermfg = 15 },
      FidgetTitle = { link = 'DiagnosticHint' },
      TelescopeResultsTitle = { bg = '#E6B455' },
      TelescopePromptTitle = { bg = '#B480D6' },
      TelescopePreviewTitle = { bg = '#ABCF76' },
      FzfPreviewTitle = { bg = '#ABCF76' },
      Identifier = { fg = "#FFFFFF" },
      ['@variables'] = { link = 'Identifier' },
      ['@property'] = { fg = '#DDDDDD' },
      ['@field'] = { link = '@property' },
      ['@variable.member'] = { link = '@property' },
      ['@parameter'] = { fg = '#EEEEEE', italic = true },
      ['@function.call'] = { fg = '#B0C9FF' },
      ['@function.builtin'] = { fg = '#B0C9FF' },
      ['@comment.documentation'] = { link = '@comment', italic = false },
      ['@lsp.type.interface'] = { fg = '#B480D6', italic = false },
      Title = { fg = '#B480D6' },
      ['@keyword.blocking'] = { fg = '#71C6E7', bold = true },
    },
    custom_colors = function(colors)
      colors.editor.fg = '#EEEEEE'
      colors.editor.fg_dark = colors.main.white
      colors.editor.accent = colors.main.darkpurple
    end,
  }
  vim.cmd.colorscheme('material')
end

function M.deepwhite()
  -- If you have some anti-blue light setting (f.lux, light bulb, or low blue light mode monitor),
  -- turn it on, this will set the background color to a cooler color to prevent the background from being too warm.
  require("deepwhite").setup({
    -- low_blue_light = true
  })
  vim.cmd.colorscheme("deepwhite")
end

function M.zenbones()
  -- vim.g.zenwritten_lightness = "bright"
  -- vim.g.zenwritten_darkness = "default"
  vim.cmd.colorscheme("zenwritten")
end

vim.cmd.colorscheme("citrus")

return M
