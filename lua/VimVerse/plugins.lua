local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) == 1 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Packer Installed"
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float{ border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily Comment Stuffs

  -- Styling 
  -- use "lunarvim/darkplus.nvim"

  -- Auto Completions
  use "hrsh7th/nvim-cmp"      -- The Completion Plugin
  use "hrsh7th/cmp-buffer"    -- Buffer Completions
  use "hrsh7th/cmp-path"      -- Path Completions
  use "hrsh7th/cmp-cmdline"   -- Cmdline Completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

    -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use{
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use "nvim-treesitter/playground"
  --use 'rockerBOO/boo-colorscheme-nvim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
