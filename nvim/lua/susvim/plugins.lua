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

	-- telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	-- treesitter
	"nvim-treesitter/nvim-treesitter",
	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/playground",
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["ap"] = "@parameter.outer",
							["ip"] = "@parameter.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "V",
							["@class.outer"] = "<c-v>",
						},
						include_surrounding_whitespace = false,
					},
				},
			})
		end,
	},

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
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},

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
		config = function()
			local status_ok, lualine = pcall(require, "lualine")
			if not status_ok then
				return
			end

			local hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end

			local diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn" },
				symbols = { error = " ", warn = " " },
				colored = false,
				update_in_insert = false,
				always_visible = true,
			}

			local diff = {
				"diff",
				colored = false,
				symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
				cond = hide_in_width,
			}

			local mode = {
				"mode",
				fmt = function(str)
					return "-- " .. str .. " --"
				end,
			}

			local filetype = {
				"filetype",
				icons_enabled = false,
				icon = nil,
			}

			local branch = {
				"branch",
				icons_enabled = true,
				icon = "",
			}

			local location = {
				"location",
				padding = 0,
			}

			-- cool function for progress
			local progress = function()
				local current_line = vim.fn.line(".")
				local total_lines = vim.fn.line("$")
				local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
				local line_ratio = current_line / total_lines
				local index = math.ceil(line_ratio * #chars)
				return chars[index]
			end

			local spaces = function()
				return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
			end

			lualine.setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
					always_divide_middle = true,
				},
				sections = {
					lualine_a = { branch, diagnostics },
					lualine_b = { mode },
					lualine_c = {},
					-- lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_x = { diff, spaces, "encoding", filetype },
					lualine_y = { location },
					lualine_z = { progress },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {},
			})
			-- require("lualine").setup({
			-- 	options = {
			-- 		theme = "catppuccin",
			-- 	},
			-- })
		end,
	},
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
})
