if not pcall(require, "telescope") then
  return
end

local key_map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


-- Dotfiles
key_map("n", "<space>en", [[<cmd>lua require("jr.telescope").edit_neovim()<CR>]], opts)

-- Search

-- Files
key_map("n", "<space>fg", [[<cmd>lua require("jr.telescope").live_grep()<CR>]], opts)
key_map("n", "<space>fd", [[<cmd>lua require("jr.telescope").find_files()<CR>]], opts)
key_map("n", "<space>fe", [[<cmd>lua require("jr.telescope").file_browser()<CR>]], opts)

-- Git

-- Nvim
key_map("n", "<space>fa", [[<cmd>lua require("jr.telescope").installed_plugins()<CR>]], opts)
key_map("n", "<space>gp", [[<cmd>lua require("jr.telescope").grep_prompt()<CR>]], opts)
key_map("n", "<space>bo", [[<cmd>lua require("jr.telescope").vim_options()<CR>]], opts)
