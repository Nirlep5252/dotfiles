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
k("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

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

-- Telescope
-- k("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
k("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
k("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Competitive programmin      
k("n", "<leader>-rt", ":CompetiTest receive testcases<CR>", opts)
k("n", "<leader>-rc", ":CompetiTest receive contest<CR>", opts)
k("n", "<leader>-rp", ":CompetiTest receive problem<CR>", opts)
k("n", "<leader>-t", ":CompetiTest run<CR>", opts)
