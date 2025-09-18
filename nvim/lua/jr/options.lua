local opt = vim.opt

-- Ignore compiled files
opt.wildignore = '__pycache__'
opt.wildignore = opt.wildignore + { '*.o', '*~', '*.pyc', '*pycache*' }

opt.autoindent = true
opt.belloff = 'all'
vim.o.colorcolumn = '100'
opt.cursorline = false
opt.cmdheight = 1
opt.expandtab = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.laststatus = 3
opt.mouse = 'a'
opt.mousescroll = "ver:1,hor:6"
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
opt.pumblend = 0
opt.wildmode = 'longest:full'
opt.wildoptions = 'pum'

-- folding
