if not pcall(require, "telescope") then
  return
end

local actions = require "telescope.actions"

require("telescope").setup{
  defaults = {
    winblend = 0,

    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      height = 0.85,
      prompt_position = "top",

      horizontal = {},

      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },

      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_horizontal,
      },
    },
  }
}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzy_native")
