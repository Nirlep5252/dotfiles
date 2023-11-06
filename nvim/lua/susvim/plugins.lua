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
    config = function ()
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
        }
      })
    end
  },

  -- completions
  "hrsh7th/nvim-cmp",           -- completions main plugin
  "hrsh7th/cmp-buffer",         -- buffer completions
  "hrsh7th/cmp-path",           -- path completions
  "hrsh7th/cmp-cmdline",        -- cmdline completions
  "saadparwaiz1/cmp_luasnip",   -- snippets completions
  "hrsh7th/cmp-nvim-lsp",       -- lsp
  "hrsh7th/cmp-nvim-lua",       -- lsp

  -- snippets
  "L3MON4D3/LuaSnip",             -- snippets engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets

  -- LSP
  "neovim/nvim-lspconfig",               -- lspconfig
  "williamboman/mason.nvim",             -- LSP installer
  "williamboman/mason-lspconfig.nvim",   -- LSP installer config
  "jose-elias-alvarez/null-ls.nvim",     -- LSP diagnostics and code actions

  -- copilot
  "zbirenbaum/copilot.lua",
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
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
  'simrat39/rust-tools.nvim',
  {
    'saecki/crates.nvim',
    tag = 'v0.4.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufRead Cargo.toml' },
    config = function()
        require('crates').setup({
          null_ls = {
            enabled = true,
            name = "crates.nvim",
          }
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
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
    config = function ()
      require("Comment").setup({
        toggler = {
          line = "<leader>/",
          block = "<leader>?"
        },
        opleader = {
          line = "<leader>/",
          block = "<leader>?",
        },
      })
    end
  },

  -- competitive programming
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function() require('competitest').setup() end,
  },
  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("leetbuddy").setup({
        language = "py"
      })
    end,
    keys = {
      { "<leader>-lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
      { "<leader>-ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
      { "<leader>-lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
      { "<leader>-lt", "<cmd>LBTest<cr>", desc = "Run Code" },
      { "<leader>-ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
    },
  }
})
