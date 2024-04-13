local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = {"c", "cpp", "rust", "javascript", "typescript", "html"},
  sync_install = false,
  --ignore_install = { "" }, -- List of parsers to ignore installing
  auto_install = true,
  autopairs = {enable= true},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    -- additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- }
}
