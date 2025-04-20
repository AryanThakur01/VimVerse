local servers = {
  "lua_ls",
  "eslint",
  "pylsp",
  "jsonls",
  "ts_ls",
  "clangd",
  "emmet_ls",
  "tailwindcss",
  "cssls",
  "denols",
  "asm_lsp",
  "jdtls",
  "prismals",
  "lexical"
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
  if server == "eslint" then
    opts.root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json")
    opts.settings = {
      workingDirectory = { mode = "location" }, -- This makes eslint-lsp respect the local project
    }
  elseif server=="tsserver" then
    opts.root_dir = lspconfig.util.root_pattern("package.json")
    opts.single_file_support = false
  elseif server=="denols" then
    opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
  elseif server=="jdtls" then
   opts.root_dir =lspconfig.util.root_pattern("gradlew", "settings.gradle") 
  elseif server=='pylsp' then
    opts.root_dir = lspconfig.util.root_pattern(".git", "setup.py", "tox.ini", "requirements.txt")
    opts.settings = {
      pylsp = {
        plugins = {
          autopep8 = { enabled = true },
          pycodestyle = { enabled = true },
        },
      },
    }
  end;
  -- =======================XX ===== XX ===== XX ==============================

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "VimVerse.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
