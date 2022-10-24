--Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Pane navigation
map("n", "<C-h>", "<C-W><C-h>")
map("n", "<C-j>", "<C-W><C-j>")
map("n", "<C-k>", "<C-W><C-k>")
map("n", "<C-l>", "<C-W><C-l>")

-- Terminal Pane Navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", {silent = true})
map("t", "<C-j>", "<C-\\><C-N><C-w>j", {silent = true})
map("t", "<C-k>", "<C-\\><C-N><C-w>k", {silent = true})
map("t", "<C-l>", "<C-\\><C-N><C-w>l", {silent = true})

-- Center Screen
map("n", "<space>", "zz")

-- Search mappings
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Same when going up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Move sanely through wrapped lines
map("n", "j", "gj")
map("n", "k", "gk")

-- Get rid of q: window
map("", "q:", ":q")
