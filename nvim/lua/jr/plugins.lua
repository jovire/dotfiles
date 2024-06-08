return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Colorscheme
        use 'rebelot/kanagawa.nvim'
        -- use 'folke/tokyonight.nvim'
        -- use 'EdenEast/nightfox.nvim'
        -- use { 'catppuccin/nvim', as = 'catppuccin' }
        use 'marko-cerovac/material.nvim'
        use { 'mcchrish/zenbones.nvim', requires = 'rktjmp/lush.nvim' }

        --Grey: Use 52000k during day and 38000k at night.
        -- use 'yorickpeterse/nvim-grey'
        use 'Verf/deepwhite.nvim'
        -- use 'bluz71/vim-moonfly-colors'
        use 'HoNamDuong/hybrid.nvim'
        use 'ronisbr/nano-theme.nvim'

	--other LSP
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'

        -- Rust
        use { 'mrcjkb/rustaceanvim', version = '^4', ft = { 'rust' }, }

        -- Haskell
        use { 'mrcjkb/haskell-tools.nvim', branch = '1.x.x' }

	-- Completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

        use { 'ibhagwan/fzf-lua', requires = { 'nvim-tree/nvim-web-devicons' } }

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

        -- Misc
        use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
        use 'j-hui/fidget.nvim'
        use { 'NvChad/nvim-colorizer.lua', config = function() require('colorizer').setup() end }
        use { 'm4xshen/hardtime.nvim', requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' } }
end)
