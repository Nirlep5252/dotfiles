local opts = { noremap = true, silent = true, }
local term_opts = { silent = true, }
local k = vim.api.nvim_set_keymap

-- Leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigation
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

-- Explorer
k("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
k("n", "<C-Up>", ":resize +2<CR>", opts)
k("n", "<C-Down>", ":resize -2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
k("n", "<S-l>", ":bnext<CR>", opts)
k("n", "<S-h>", ":bprevious<CR>", opts)

-- Indentations
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- Fix paste
k("v", "p", '"_dP', opts)
