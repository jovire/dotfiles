local opt = vim.opt

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

opt.autoindent = true
opt.belloff = "all"
opt.cursorline = false
opt.cmdheight = 1
opt.expandtab = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.laststatus = 3
opt.mouse = "n"
opt.showcmd = true
opt.showmode = false
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false

-- Completion menu
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"
