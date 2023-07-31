-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.guicursor = "i:block"

lvim.builtin.terminal.open_mapping = "<c-t>"

-- table.insert(lvim.plugins, {
--   "zbirenbaum/copilot-cmp",
--   event = "InsertEnter",
--   dependencies = { "zbirenbaum/copilot.lua" },
--   config = function()
--     vim.defer_fn(function()
--       require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
--       require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
--     end, 100)
--   end,
-- })
table.insert(lvim.plugins, {
  "Mofiqul/dracula.nvim"
})

lvim.transparent_window = true

if vim.g.neovide then
  vim.opt.guifont = "Cascadia Code:h9"
  -- vim.g.neovide_transparency = 0.8
  vim.g.neovide_background_color = "#282a36"
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  lvim.transparent_window = false
  vim.g.neovide_fullscreen = false
  vim.cmd("colorscheme dracula")
end
