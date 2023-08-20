return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- Colorscheme
        use "rebelot/kanagawa.nvim"
        use "folke/tokyonight.nvim"
        -- use "EdenEast/nightfox.nvim"
        use "nyoom-engineering/oxocarbon.nvim"
        use { "catppuccin/nvim", as = "catppuccin" }
        use "marko-cerovac/material.nvim"

	--other LSP
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"

        -- Haskell
        use { "mrcjkb/haskell-tools.nvim", branch = "1.x.x" }

	-- Completion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"

        -- Telescope
        use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim"} }
        use "nvim-telescope/telescope-fzy-native.nvim"
        use "nvim-telescope/telescope-file-browser.nvim"

	-- Treesitter
	use "nvim-treesitter/nvim-treesitter"

        -- Misc
        use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }
        use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }
        use "j-hui/fidget.nvim"
        use { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end }
        use "rktjmp/lush.nvim"
end)
