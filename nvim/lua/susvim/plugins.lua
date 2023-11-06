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
})
