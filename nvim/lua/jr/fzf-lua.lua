local key_map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

key_map('n', '<space>en', [[<cmd>lua require('fzf-lua').files({cwd = "~/.config/nvim"})<CR>]], opts)
key_map('n', '<space>cs', [[<cmd>FzfLua colorschemes<CR>]], opts)

key_map('n', '<space>fd', [[<cmd>FzfLua files<CR>]], opts)
key_map('n', '<space>fg', [[<cmd>FzfLua live_grep_glob<CR>]], opts)
