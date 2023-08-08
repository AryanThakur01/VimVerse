local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("LspConfig Not Working")
  return
end

require("VimVerse.lsp.mason")
require("VimVerse.lsp.handlers").setup()
require("VimVerse.lsp.null-ls")
