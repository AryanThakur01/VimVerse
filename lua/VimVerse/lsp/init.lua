local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  print("LspConfig Not Working")
  return
end

require("VimVerse.lsp.handlers").setup()
require("VimVerse.lsp.mason")
