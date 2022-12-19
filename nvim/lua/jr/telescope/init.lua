local M = {}

function M.edit_neovim()
  local opts_with_preview

  opts_with_preview = {
    prompt_tile = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",

    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,

      horizontal = {
        width = { padding = 0.15 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },

    mappings = {
      i = {
        ["<C-y>"] = false,
      },
    },
  }

  require("telescope.builtin").find_files(opts_with_preview)
end

function M.find_files()
  require("telescope.builtin").find_files {
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    layout_config = {},
  }
end

function M.live_grep()
  require("telescope.builtin").live_grep {
    previewer = false,
    fzf_separator = "|>",
  }
end

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    path_display = { "shorten" },
    search = vim.fn.input "Grep String > ",
  }
end

function M.installed_plugins()
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath "data" .. "/site/pack/packer/start/",
  }
end

function M.file_browser()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

function M.lsp_references()
  require("telescope.builtin").lsp_references {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
end

function M.lsp_implementations()
  require("telescope.builtin").lsp_implementations {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
}
end

function M.vim_options()
  require("telescope.builtin").vim_options {
    layout_config = {
      width = 0.5,
    },
    sorting_strategy = "ascending",
  }
end

return M
