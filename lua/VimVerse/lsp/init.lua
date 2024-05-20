local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  print("LspConfig Not Working")
  return
end

require("VimVerse.lsp.mason")
require("VimVerse.lsp.handlers").setup()
