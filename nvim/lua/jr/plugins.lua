return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- Colorscheme
        use { "alexaandru/froggy", requires = { "rktjmp/hotpot.nvim" } }
        use { "NTBBloodbath/doom-one.nvim", setup = function()
          vim.g.doom_one_italic_comments = true
          vim.g.doom_one_enable_treesitter = true
        end,
        }
        use "sainnhe/gruvbox-material"

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

        -- Misc
        use { "tjdevries/express_line.nvim", requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" } }
        use "j-hui/fidget.nvim"
        use { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end }

end)
