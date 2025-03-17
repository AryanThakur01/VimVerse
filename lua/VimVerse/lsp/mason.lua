local servers = {
  "lua_ls",
  ---- "pyright",
  "pylsp",
  "jsonls",
  -- "tsserver",
  "ts_ls",
  "clangd",
  "emmet_ls",
  "tailwindcss",
  --"theme_check",
  "cssls",
  "denols",
  "asm_lsp",
  "jdtls",
  "prismals"
  --"mdx_analyzer"
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  print("lspconfig not working")
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("VimVerse.lsp.handlers").on_attach,
    capabilities = require("VimVerse.lsp.handlers").capabilities,
  }

  -- ================= Configurations for specific lsp servers ================
  if server=="tsserver" then
    opts.root_dir = lspconfig.util.root_pattern("package.json")
    opts.single_file_support = false
  elseif server=="denols" then
    opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
  elseif server=="jdtls" then
   opts.root_dir =lspconfig.util.root_pattern("gradlew", "settings.gradle") 
  --  opts.cmd = {'/path/to/jdt-language-server/bin/jdtls'}
  end;
  -- =======================XX ===== XX ===== XX ==============================

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "VimVerse.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
