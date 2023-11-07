-- Lazy.nvim 💤
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins go brrr
require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"nvim-lua/plenary.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},

	-- telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	-- treesitter
	"nvim-treesitter/nvim-treesitter",
	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/playground",
	"nvim-treesitter/nvim-treesitter-textobjects",

	-- completions
	"hrsh7th/nvim-cmp", -- completions main plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippets completions
	"hrsh7th/cmp-nvim-lsp", -- lsp
	"hrsh7th/cmp-nvim-lua", -- lsp

	-- snippets
	"L3MON4D3/LuaSnip", -- snippets engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets

	-- LSP
	"neovim/nvim-lspconfig", -- lspconfig
	"williamboman/mason.nvim", -- LSP installer
	"williamboman/mason-lspconfig.nvim", -- LSP installer config
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions

	-- copilot
	"zbirenbaum/copilot.lua",
	"zbirenbaum/copilot-cmp",

	-- file tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				git = {
					enable = true,
					ignore = false,
				},
			})
		end,
	},

	-- rust btw
	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		tag = "v0.4.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
			})
		end,
	},

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && bun install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- comments
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
		config = function()
			require("Comment").setup({
				toggler = {
					line = "<leader>/",
					block = "<leader>?",
				},
				opleader = {
					line = "<leader>/",
					block = "<leader>?",
				},
			})
		end,
	},

	-- competitive programming
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup()
		end,
	},
	{
		"Dhanus3133/LeetBuddy.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("leetbuddy").setup({
				language = "py",
			})
		end,
		keys = {
			{ "<leader>-lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
			{ "<leader>-ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
			{ "<leader>-lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
			{ "<leader>-lt", "<cmd>LBTest<cr>", desc = "Run Code" },
			{ "<leader>-ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
		},
	},

	-- git stuff
	"lewis6991/gitsigns.nvim",

	-- learning neovim
	-- {
	--   "m4xshen/hardtime.nvim",
	--   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	--   opts = {},
	--   config = function()
	--     require("hardtime").setup()
	--   end
	-- },

	-- autotags for html and stuff
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"chrisgrieser/nvim-puppeteer",
		lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
	},

	-- UI
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
})
