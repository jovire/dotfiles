local opt = vim.opt

-- Ignore compiled files
opt.wildignore = '__pycache__'
opt.wildignore = opt.wildignore + { '*.o', '*~', '*.pyc', '*pycache*' }

opt.autoindent = true
opt.belloff = 'all'
opt.cursorline = false
opt.cmdheight = 1
opt.expandtab = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.laststatus = 3
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.showcmd = true
opt.showmode = false
vim.o.signcolumn = 'yes'
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false

-- Completion menu
opt.pumblend = 17
opt.wildmode = 'longest:full'
opt.wildoptions = 'pum'
