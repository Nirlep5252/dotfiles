-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.guicursor = "i:block"

vim.filetype.add({
  extension = {
    mdx = "mdx"
  }
})
-- local ft_to_parse = require("nvim-treesitter.parsers").filetype_to_parsername
vim.treesitter.language.register("markdown", "mdx")

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
  "Mofiqul/dracula.nvim",
  {
    "catppuccin/nvim",
    config = function()
      vim.g.catppuccin_flavour = "mocha"
    end
  },
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require('competitest').setup()
      vim.keymap.set("n", "<leader>-rt", function() vim.cmd(":CompetiTest receive testcases") end)
      vim.keymap.set("n", "<leader>-rc", function() vim.cmd(":CompetiTest receive contest") end)
      vim.keymap.set("n", "<leader>-rp", function() vim.cmd(":CompetiTest receive problem") end)
      vim.keymap.set("n", "<leader>-t", function() vim.cmd(":CompetiTest run") end)
    end,
  }
})

lvim.transparent_window = true
lvim.colorscheme = "catppuccin-mocha"

if vim.g.neovide then
  vim.opt.guifont = "Cascadia Code:h11"
  -- vim.g.neovide_transparency = 0.8
  vim.g.neovide_background_color = "#282a36"
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  lvim.transparent_window = false
  vim.g.neovide_fullscreen = false
  vim.cmd("colorscheme catppuccin")
end
