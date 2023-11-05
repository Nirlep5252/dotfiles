local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("susvim.lsp.mason")
require("susvim.lsp.handlers").setup()
require("susvim.lsp.null-ls")
require("susvim.lsp.rust")
