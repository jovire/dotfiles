return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- Colorscheme
	use "romainl/Apprentice"
        use "junegunn/seoul256.vim"
        use { "alexaandru/froggy", requires = { "rktjmp/hotpot.nvim" } }

	-- LSP
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"

	-- Completion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"

	-- Treesitter
	use "nvim-treesitter/nvim-treesitter"

        -- UI
        use "j-hui/fidget.nvim"
        -- use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
        use { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end }

end)
